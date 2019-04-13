import 'package:geolocator/geolocator.dart';

import '../models/models.dart';

Future<Location> getCurrentLocation() async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return Location.fromPosition(position);
}
