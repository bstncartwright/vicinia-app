import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:geolocator/geolocator.dart';

import 'serializers.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  Location._();

  factory Location([updates(LocationBuilder b)]) = _$Location;

  @BuiltValueField(wireName: 'long')
  double get long;
  @BuiltValueField(wireName: 'lat')
  double get lat;
  String toJson() {
    return json.encode(serializers.serializeWith(Location.serializer, this));
  }

  static Location fromJson(String jsonString) {
    return serializers.deserializeWith(
        Location.serializer, json.decode(jsonString));
  }

  static Location fromPosition(Position position) {
    return Location((b) => b
      ..lat = position.latitude
      ..long = position.longitude);
  }

  static Serializer<Location> get serializer => _$locationSerializer;
}
