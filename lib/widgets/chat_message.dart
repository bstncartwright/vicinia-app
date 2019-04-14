import 'package:flutter/material.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class ChatMessage extends StatelessWidget {
  final Key key;
  final Message message;
  final bool incoming;

  const ChatMessage({this.key, @required this.message, @required this.incoming})
      : assert(message != null),
        super(key: key);

  String _ago(int minutes) {
    if (minutes == 0) {
      return "Now";
    } else if (minutes > 60) {
      int s = minutes ~/ 60;
      if (s > 1) {
        return "$s hours ago";
      } else {
        return "$s hour ago";
      }
    } else {if(minutes == 1){
      return "$minutes minute ago";
    }else{
      return "$minutes minutes ago";
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    var sTime = message.time;
    var coolTime = DateTime.parse(sTime);
    var time = _ago(DateTime.now().difference(coolTime).inMinutes);
    return Container(
      child: Padding(
        padding: incoming
            ? const EdgeInsets.only(
                right: 64.0,
              )
            : const EdgeInsets.only(
                left: 64.0,
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Stack(
                //mainAxisAlignment:
                //incoming ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: !incoming ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      Text(
                        time,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: !incoming ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Text(
                        message.name,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(fontSize: 18.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: incoming
                  ? Theme.of(context).cardColor
                  : ThemeFactory().dark(),
              margin: EdgeInsets.only(bottom: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  bottom: 12.0,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text(message.name,
                            //     style: Theme.of(context).textTheme.title),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: incoming
                                  ? Text(message.text)
                                  : Text(
                                      message.text,
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageFader {
  final ChatMessage chatMessage;
  bool faded = false;

  ChatMessageFader({@required this.chatMessage}) : assert(chatMessage != null);
}
