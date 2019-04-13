import 'package:flutter/material.dart';

import '../models/models.dart';

class ChatMessage extends StatelessWidget {
  final Key key;
  final Message message;

  const ChatMessage({this.key, @required this.message})
      : assert(message != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(child: Text(message.name[0])),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(message.name, style: Theme.of(context).textTheme.subhead),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(message.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageFader {
  final ChatMessage chatMessage;
  bool faded = false;

  ChatMessageFader({@required this.chatMessage}) : assert(chatMessage != null);
}
