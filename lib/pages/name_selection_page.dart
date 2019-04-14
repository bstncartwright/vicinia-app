import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter/animation.dart';

import 'pages.dart';
import '../utils/utils.dart';

class NameSelectionPage extends StatefulWidget {
  @override
  _NameSelectionPageState createState() => _NameSelectionPageState();
}

class _NameSelectionPageState extends State<NameSelectionPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _focused = false;
  AnimationController animationController;
  Animation<TextStyle> animation;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _focused
              ? animationController.reverse()
              : animationController.forward();
          _focused = !_focused;
        });
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = TextStyleTween(
            begin: Theme.of(context).textTheme.display2.copyWith(
                  color: ThemeFactory().dark(),
                  fontWeight: FontWeight.bold,
                ),
            end: Theme.of(context).textTheme.display1.copyWith(
                color: ThemeFactory().dark(), fontWeight: FontWeight.bold))
        .animate(animationController)
          ..addListener(() {
            setState(() {
              // animate!
            });
          });
  }

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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          _handleSubmitted(_textController.text);
        }
      },
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx < 0) {
          _handleSubmitted(_textController.text);
        }
      },
      child: Scaffold(
        //appBar: AppBar(title: Text("Username | Vicinia")),
        body: Center(
          child: Container(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 96.0,
                        left: 32.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        key: UniqueKey(),
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Create your \nusername",
                            style: animation.value,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Username",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeFactory().grey(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: _textController,
                            onSubmitted: _handleSubmitted,
                            autocorrect: false,
                            maxLength: 18,
                            maxLengthEnforced: true,
                            decoration: InputDecoration.collapsed(
                              hintText: "",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("SWIPE RIGHT TO JOIN"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
