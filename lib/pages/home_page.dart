import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'pages.dart';
import '../utils/utils.dart';
import '../animations/animations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LocationerTest(),
      ),
    );
  }
}

class LocationerTest extends StatefulWidget {
  @override
  _LocationerTestState createState() => _LocationerTestState();
}

class _LocationerTestState extends State<LocationerTest> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => FadeInStraight(1, NameSelectionPage())));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icon/icon.png'),
      ),
    );
  }
}
