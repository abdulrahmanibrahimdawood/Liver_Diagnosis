import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:liver_diagnosis/core/map_helper/distance_notifier.dart';
import 'package:liver_diagnosis/core/map_helper/location_service.dart';
import 'package:liver_diagnosis/core/map_helper/map_controller_helper.dart';
import 'package:liver_diagnosis/core/map_helper/route_service.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double long;

  const MapScreen({super.key, required this.lat, required this.long});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController mapController = MapController();
  late final ILocationService locationService;
  late final IRouteService routeService;
  late final MapControllerHelper mapHelper;
  late final DistanceNotifier distanceNotifier;

  @override
  void initState() {
    super.initState();

    locationService = LocationService();
    routeService = RouteService();
    mapHelper = MapControllerHelper(mapController);
    distanceNotifier = DistanceNotifier();

    _initMap();
  }

  Future<void> _initMap() async {
    final currentLocation = await locationService.getCurrentLocation(context);
    if (currentLocation == null) return;

    mapHelper.updateMarkers(currentLocation, LatLng(widget.lat, widget.long));
    mapController.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!), 15.0);

    distanceNotifier.calculateDistance(
      currentLocation,
      LatLng(widget.lat, widget.long),
      onAlert: () {
        _showMessage("You are near your destination!");
        SystemSound.play(SystemSoundType.alert);
      },
    );

    final routePoints = await routeService.getRoute(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        LatLng(widget.lat, widget.long));

    mapHelper.updateRoute(routePoints);

    locationService.getLocationStream().listen((newLocation) async {
      mapHelper.updateMarkers(newLocation, LatLng(widget.lat, widget.long));

      distanceNotifier.calculateDistance(
        newLocation,
        LatLng(widget.lat, widget.long),
        onAlert: () {
          _showMessage("You are near your destination!");
          SystemSound.play(SystemSoundType.alert);
        },
      );

      final routePoints = await routeService.getRoute(
          LatLng(newLocation.latitude!, newLocation.longitude!),
          LatLng(widget.lat, widget.long));
      mapHelper.updateRoute(routePoints);
    });
  }

  void _showMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(fontSize: 12.sp)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        centerTitle: true,
        title: Text(
          'Maps',
          style: TextStyle(
              fontSize: 19.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp, color: Colors.white),
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
              mapHelper.buildTileLayer(),
              mapHelper.buildMarkers(),
              mapHelper.buildPolyline(),
            ],
          ),
          if (distanceNotifier.remainingDistance != null)
            Positioned(
              top: 20.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "Remaining distance: ${distanceNotifier.remainingDistance!.toStringAsFixed(2)} km",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final currentLocation =
              await locationService.getCurrentLocation(context);
          if (currentLocation == null) return;

          final routePoints = await routeService.getRoute(
              LatLng(currentLocation.latitude!, currentLocation.longitude!),
              LatLng(widget.lat, widget.long));

          mapHelper.updateRoute(routePoints);
        },
        child: Icon(Icons.directions, size: 24.sp),
      ),
    );
  }
}
