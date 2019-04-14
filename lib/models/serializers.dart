import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'message.dart';
import 'location.dart';
import 'up_message.dart';

part 'serializers.g.dart';

@SerializersFor(const [Message, Location, UpMessage])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
