import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapControllerHelper {
  final MapController mapController;
  final List<Marker> _markers = [];
  List<LatLng> _routePoints = [];

  MapControllerHelper(this.mapController);

  void updateMarkers(dynamic currentLocation, LatLng destination) {
    _markers.clear();
    _markers.add(Marker(
      width: 80,
      height: 80,
      point: LatLng(currentLocation.latitude, currentLocation.longitude),
      child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
    ));

    _markers.add(Marker(
      width: 80,
      height: 80,
      point: destination,
      child: const Icon(Icons.location_on, color: Colors.red, size: 40),
    ));
  }

  void updateRoute(List<LatLng> points) {
    _routePoints = points;
  }

  TileLayer buildTileLayer() {
    return TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
    );
  }

  MarkerLayer buildMarkers() {
    return MarkerLayer(markers: List.from(_markers));
  }

  PolylineLayer buildPolyline() {
    if (_routePoints.isEmpty) return const PolylineLayer(polylines: []);
    return PolylineLayer(polylines: [
      Polyline(
        points: _routePoints,
        strokeWidth: 4,
        color: Colors.blue.withValues(alpha: 0.7),
      )
    ]);
  }
}
