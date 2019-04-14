import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';
import 'location.dart';

part 'up_message.g.dart';

abstract class UpMessage implements Built<UpMessage, UpMessageBuilder> {
  UpMessage._();

  factory UpMessage([updates(UpMessageBuilder b)]) = _$UpMessage;

  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'text')
  String get text;
  @BuiltValueField(wireName: 'time')
  String get time;
  @BuiltValueField(wireName: 'location')
  Location get location;
  String toJson() {
    return json.encode(serializers.serializeWith(UpMessage.serializer, this));
  }

  static UpMessage fromJson(String jsonString) {
    return serializers.deserializeWith(
        UpMessage.serializer, json.decode(jsonString));
  }

  static Serializer<UpMessage> get serializer => _$upMessageSerializer;
}
