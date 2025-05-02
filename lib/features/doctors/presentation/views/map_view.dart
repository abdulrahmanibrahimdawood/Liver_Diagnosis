import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  final double lat;
  final double long;

  const MapScreen({
    super.key,
    required this.lat,
    required this.long,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  LocationData? currentLocation;
  final String orsApiKey =
      '5b3ce3597851110001cf6248b0c45dd132794f37b4310837c49fcda4';
  late Location location;
  late final StreamSubscription<LocationData> _locationSubscription;

  @override
  void initState() {
    super.initState();
    location = Location();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _showMessage("❌ خدمة الموقع غير مفعلة");
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _showMessage("❌ لم يتم منح صلاحية الموقع");
        return;
      }
    }

    try {
      LocationData userLocation = await location.getLocation();
      print(
          "📍 الموقع الحالي: ${userLocation.latitude}, ${userLocation.longitude}");
      setState(() {
        currentLocation = userLocation;
        _updateMarkers();
      });

      mapController.move(
        LatLng(userLocation.latitude!, userLocation.longitude!),
        15.0,
      );

      _getRoute();
    } catch (e) {
      _showMessage("❌ فشل في الحصول على الموقع: $e");
    }

    _locationSubscription =
        location.onLocationChanged.listen((LocationData newLocation) {
      if (!mounted) return;
      print(
          "📍 الموقع المحدث: ${newLocation.latitude}, ${newLocation.longitude}");
      setState(() {
        currentLocation = newLocation;
        _updateMarkers();
      });
    });
  }

  void _updateMarkers() {
    markers.clear();

    if (currentLocation != null) {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          child: const Icon(Icons.my_location, color: Colors.blue, size: 40.0),
        ),
      );
    }

    markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(widget.lat, widget.long),
        child: const Icon(Icons.location_on, color: Colors.red, size: 40.0),
      ),
    );
  }

  Future<void> _getRoute() async {
    if (currentLocation == null) return;

    final start =
        LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
    final end = LatLng(widget.lat, widget.long);

    final distance = const Distance().as(LengthUnit.Meter, start, end);
    if (distance > 6000000) {
      _showMessage("❌ المسافة بين النقطتين كبيرة جدًا (أكثر من 6000 كم)");
      return;
    }

    final response = await http.get(
      Uri.parse(
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> coords =
          data['features'][0]['geometry']['coordinates'];

      setState(() {
        routePoints =
            coords.map((coord) => LatLng(coord[1], coord[0])).toList();
      });
    } else {
      print('❌ Status Code: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');
      _showMessage("❌ فشل في جلب المسار");
    }
  }

  void _showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  void dispose() {
    _locationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: LatLng(widget.lat, widget.long),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(markers: List.from(markers)),
          if (routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: routePoints,
                  strokeWidth: 4.0,
                  color: Colors.blue.withOpacity(0.7),
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRoute,
        child: const Icon(Icons.directions),
      ),
    );
  }
}
