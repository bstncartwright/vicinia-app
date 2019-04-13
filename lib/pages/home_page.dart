import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
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
  String location = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Your location is $location"),
          MaterialButton(
            child: Text("Get location"),
            onPressed: () async {
              Position position = await Geolocator()
                  .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
              setState(() {
                location = "${position.longitude}, ${position.latitude}";
              });
            },
          )
        ],
      ),
    );
  }
}
