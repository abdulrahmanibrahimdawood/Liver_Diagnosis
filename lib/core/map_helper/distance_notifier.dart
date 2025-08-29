import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class DistanceNotifier {
  double? remainingDistance;
  bool alerted = false;

  void calculateDistance(LocationData currentLocation, LatLng destination,
      {required Function onAlert}) {
    final start = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    final end = destination;
    final distance = const Distance().as(LengthUnit.Meter, start, end);

    remainingDistance = distance / 1000;

    if (distance <= 100 && !alerted) {
      alerted = true;
      onAlert();
    }
  }
}
