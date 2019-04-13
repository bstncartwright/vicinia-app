import 'dart:async';
import 'dart:convert';

import '../models/models.dart';
import 'api/vicinia_api.dart';
export 'api/vicinia_api.dart';

class ViciniaRepository {
  final ViciniaApiClient api;

  ViciniaRepository({this.api}) : assert(api != null);

  Future<bool> createMessage(Message message) async {
    var result = await api.createMessage(message);
    if (result.statusCode != 200) {
      // TODO handle error
      return false;
    }
    return true;
  }

  Future<List<Message>> getMessages(Location location) async {
    var locationJson = location.toJson();
    var result = await api.getMessages(locationJson);
    var messages = <Message>[];
    if (result.statusCode != 200) {
      // TODO handle error
      return messages;
    }
    var elements = json.decode(result.data);
    var messagesList = List<dynamic>.from(elements);

    for (var messageId in messagesList) {
      var message = await getMessage(messageId);
      messages.add(message);
    }

    return messages;
  }

  Future<Message> getMessage(String id) async {
    var result = await api.getMessage(id);
    if (result.statusCode != 200) {
      // TODO handle error
      return Message((b) => b
        ..text = "MESSAGE ERROR"
        ..name = "VICINIA APP");
    }
    var message = Message.fromJson(result.data);
    return message;
  }
}
