import 'package:geolocator/geolocator.dart';

import '../models/models.dart';

Future<Location> getCurrentLocation() async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return Location.fromPosition(position);
}

Future<Placemark> getPlacemarkFromLocation(Location location) async {
  var placemarks =
      await Geolocator().placemarkFromCoordinates(location.lat, location.long);
  var placemark = placemarks.first;
  return placemark;
}
