import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'message.dart';
import 'location.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Message,
  Location
])

final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
