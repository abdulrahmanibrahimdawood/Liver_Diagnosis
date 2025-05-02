import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double long;

  const MapScreen({super.key, required this.lat, required this.long});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  List<LatLng> routePoints = [];
  List<Marker> markers = [];
  LocationData? currentLocation;
  final String orsApiKey =
      '5b3ce3597851110001cf6248b0c45dd132794f37b4310837c49fcda4';
  late Location location;
  late final StreamSubscription<LocationData> _locationSubscription;
  double? remainingDistance;
  bool alerted = false;

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
        _showMessage("Location service is disabled.");
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _showMessage("Location permission not granted.");
        return;
      }
    }

    try {
      LocationData userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
        _updateMarkers();
      });

      mapController.move(
        LatLng(userLocation.latitude!, userLocation.longitude!),
        15.0,
      );

      await _getRoute(); // أول مرة فقط
    } catch (e) {
      _showMessage("Failed to get location: $e");
    }

    _locationSubscription =
        location.onLocationChanged.listen((LocationData newLocation) async {
      if (!mounted) return;

      setState(() {
        currentLocation = newLocation;
        _updateMarkers();
      });

      final start =
          LatLng(currentLocation!.latitude!, currentLocation!.longitude!);
      final end = LatLng(widget.lat, widget.long);
      final distance = const Distance().as(LengthUnit.Meter, start, end);

      setState(() {
        remainingDistance = distance / 1000;
      });

      if (distance <= 100 && !alerted) {
        alerted = true;
        _showMessage("You are near your destination!");
        SystemSound.play(SystemSoundType.alert);
      }

      // تحديث المسار عند كل حركة
      await _getRoute();
    });
  }

  void _updateMarkers() {
    markers.clear();

    if (currentLocation != null) {
      markers.add(
        Marker(
          width: 80.w,
          height: 80.h,
          point:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          child: Icon(Icons.my_location, color: Colors.blue, size: 40.sp),
        ),
      );
    }

    markers.add(
      Marker(
        width: 80.w,
        height: 80.h,
        point: LatLng(widget.lat, widget.long),
        child: Icon(Icons.location_on, color: Colors.red, size: 40.sp),
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
      _showMessage("The distance between points is too large (over 6000 km).");
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
      _showMessage("Failed to fetch route.");
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
        title: Text('Maps', style: TextStyle(fontSize: 20.sp)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
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
                      strokeWidth: 4.w,
                      color: Colors.blue.withValues(alpha: .7),
                    ),
                  ],
                ),
            ],
          ),
          if (remainingDistance != null)
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Remaining distance: ${remainingDistance!.toStringAsFixed(2)} km",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRoute,
        child: Icon(Icons.directions, size: 24.sp),
      ),
    );
  }
}
