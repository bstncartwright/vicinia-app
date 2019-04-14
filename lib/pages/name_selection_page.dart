import 'package:flutter/material.dart';

import 'pages.dart';
import '../utils/utils.dart';

class NameSelectionPage extends StatefulWidget {
  @override
  _NameSelectionPageState createState() => _NameSelectionPageState();
}

class _NameSelectionPageState extends State<NameSelectionPage> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _textController.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => ChatPage(
                repository: Constants.of(context).viciniaRepository,
                name: text,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          _handleSubmitted(_textController.text);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Username | Vicinia")),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("USERNAME", style: Theme.of(context).textTheme.title),
                Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    autocorrect: false,
                    maxLength: 18,
                    decoration: InputDecoration.collapsed(
                      hintText: "username",
                      filled: true,
                      fillColor: ThemeFactory().grey(),
                    ),
                  ),
                ),
                Text("SWIPE RIGHT TO JOIN"),
                // RaisedButton(
                //   color: ThemeFactory().blue(),
                //   child: Text(
                //     "JOIN",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onPressed: () => _handleSubmitted(_textController.text),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
