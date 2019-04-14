import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'vicinia_api.dart';
import '../../models/models.dart';

class DummyViciniaApiClient extends ViciniaApiClient {
  final String url;
  final String code;
  final Dio dio;

  DummyViciniaApiClient(
      {@required this.url, @required this.code, @required this.dio})
      : assert(url != null),
        assert(code != null),
        assert(dio != null),
        super(code: code, url: url, dio: dio);

  final List<Message> messages = <Message>[]
    ..add(Message.fromJson(
        '{"id":"GL39 7620 9659 2444 08","text":"Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.","name":"kandrioli0","time":"2018-06-27T12:16:49Z","location":{"long":46.914966,"lat":14.061619}}'))
    ..add(Message.fromJson(
        '{"id":"RS47 0872 3946 7660 4637 40","text":"Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.","name":"wjovovic1","time":"2019-03-12T13:41:37Z","location":{"long":16.3060863,"lat":49.6610036}}'))
    ..add(Message.fromJson(
        '{"id":"IS25 5891 7707 6561 8857 8167 44","text":"In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.","name":"eenticknap2","time":"2018-09-17T00:07:57Z","location":{"long":109.0311079,"lat":37.2715427}}'))
    ..add(Message.fromJson(
        '{"id":"LB25 7037 TLEK LRUD CIJQ TCKY QSZV","text":"Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.","name":"zpletts3","time":"2019-01-18T05:12:40Z","location":{"long":-87.4678266,"lat":14.0666041}}'))
    ..add(Message.fromJson(
        '{"id":"PK09 BVPU IF5D CU6T KD8O HTSN","text":"Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.","name":"aianelli4","time":"2019-02-20T23:43:34Z","location":{"long":116.0761121,"lat":5.9840985}}'))
    ..add(Message.fromJson(
        '{"id":"PK13 ZVVE SKH9 SXWO I1Z3 ADCB","text":"In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.","name":"cbaldin5","time":"2019-04-08T02:31:53Z","location":{"long":105.770542,"lat":26.663449}}'))
    ..add(Message.fromJson(
        '{"id":"FR50 1708 2537 32DW KXAA MHWG S51","text":"Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.","name":"bharmar6","time":"2019-02-25T05:27:30Z","location":{"long":116.0594701,"lat":-8.3535966}}'))
    ..add(Message.fromJson(
        '{"id":"NO92 2970 0975 076","text":"Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.","name":"twedmore7","time":"2018-05-12T01:13:59Z","location":{"long":15.8843252,"lat":45.7608012}}'));

  Future<Response> createMessage(dynamic message) async {
    await Future.delayed(Duration(milliseconds: 33));
    var newMessage = Message.fromJson(json.encode(message));
    if (newMessage.text == "error!") {
      return Response(statusCode: 500);
    }
    messages.insert(0, newMessage);
    return Response(statusCode: 200);
  }

  Future<Response> getMessages(dynamic location) async {
    await Future.delayed(Duration(milliseconds: 33));
    var messageList = <String>[];
    for (var item in messages) {
      messageList.add(item.id);
    }
    return Response(data: json.encode(messageList), statusCode: 200);
  }

  Future<Response> getMessage(String id) async {
    await Future.delayed(Duration(milliseconds: 33));
    var message = messages.firstWhere((message) => message.id == id);
    if (message == null) {
      return Response(statusCode: 400);
    }
    return Response(statusCode: 200, data: message.toJson());
  }
}
