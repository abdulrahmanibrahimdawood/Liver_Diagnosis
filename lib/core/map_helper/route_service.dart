import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class IRouteService {
  Future<List<LatLng>> getRoute(LatLng start, LatLng end);
}

class RouteService implements IRouteService {
  final String orsApiKey = 'YOUR_API_KEY';

  @override
  Future<List<LatLng>> getRoute(LatLng start, LatLng end) async {
    final distance = const Distance().as(LengthUnit.Meter, start, end);
    if (distance > 6000000) return [];

    final response = await http.get(
      Uri.parse(
          'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$orsApiKey&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final coords = data['features'][0]['geometry']['coordinates'] as List;
      return coords.map((coord) => LatLng(coord[1], coord[0])).toList();
    } else {
      return [];
    }
  }
}
