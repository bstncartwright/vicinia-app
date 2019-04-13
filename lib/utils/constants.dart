import 'package:flutter/material.dart';
import '../repository/repository.dart';
import 'package:dio/dio.dart';

// TODO remove dummy api
import '../repository/api/dummy_vicinia_api.dart';

class Constants extends InheritedWidget {
  static Constants of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(Constants);

  Constants({Widget child, Key key}) : super(key: key, child: child);

  final ViciniaRepository viciniaRepository = ViciniaRepository(
    api: DummyViciniaApiClient(
      url: 'url.com',
      code: '12345',
      dio: Dio(),
    ),
  );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
