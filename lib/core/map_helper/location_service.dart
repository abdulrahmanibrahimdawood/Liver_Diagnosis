import 'package:location/location.dart';
import 'package:flutter/material.dart';

abstract class ILocationService {
  Future<LocationData?> getCurrentLocation(BuildContext context);
  Stream<LocationData> getLocationStream();
}

class LocationService implements ILocationService {
  late final Location _location;
  LocationService() {
    _location = Location();
  }

  @override
  Future<LocationData?> getCurrentLocation(BuildContext context) async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location service is disabled.")));
        return null;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Location permission not granted.")));
        return null;
      }
    }

    return await _location.getLocation();
  }

  @override
  Stream<LocationData> getLocationStream() {
    return _location.onLocationChanged;
  }
}
