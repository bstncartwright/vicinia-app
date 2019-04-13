import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class ViciniaApiClient {
  final String url;
  final String code;
  final Dio dio;

  ViciniaApiClient(
      {@required this.url, @required this.code, @required this.dio})
      : assert(url != null),
        assert(code != null),
        assert(dio != null);

  Future<Response> createMessage(dynamic message) async {}

  Future<Response> getMessages(dynamic location) async {}

  Future<Response> getMessage(String id) async {}
}
