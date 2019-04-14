import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

class ViciniaApiClient {
  final String url;
  final Dio dio;

  ViciniaApiClient({@required this.url, @required this.dio})
      : assert(url != null),
        assert(dio != null);

  Future<Response> createMessage(Message message) async {
    var jsonData = UpMessage.fromJson(
            '{ "id":"${message.id}", "time":"${message.time}", "name":"${message.name}", "text": "${message.text}", "location":{ "long":${message.location.long}, "lat":${message.location.lat} } }')
        .toJson();
    var result = await dio.post(
      '$url/api/CreateMessage',
      data: jsonData,
      queryParameters: {
        "code": "QMjMuaVfVfj9txGxmAiPvUOGFN1L1Xz0hbrRoCXjE80KUMCLeUufXA==",
      },
    );
    return result;
  }

  Future<Response> getMessages(Location location) async {
    var result = await dio.get(
      '$url/api/GetMessages',
      queryParameters: {
        "code": "HZbzaeIIGhLnCnfV9GX/Su71aoXr83bSLQRNkCjdM9JA3UFJvVIhnA==",
        "location": '{ "long":${location.long}, "lat":${location.lat} }'
      },
    );
    return result;
  }

  Future<Response> getMessage(String id) async {
    var result = await dio.get('$url/api/GetMessage', queryParameters: {
      "code": "j6SdzihtSAaWUXaeiur9ajKT9fjdna/66mLjWrTLaZZrsuhyGSgjBw==",
      "id": id
    });
    return result;
  }
}
