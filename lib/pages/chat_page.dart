import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../repository/repository.dart';
import '../widgets/widgets.dart';
import '../animations/animations.dart';
import '../models/models.dart';

class ChatPage extends StatefulWidget {
  final ViciniaRepository repository;

  const ChatPage({Key key, @required this.repository}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  ChatBloc _chatBloc;

  List<ChatMessageFader> _chatMessages = <ChatMessageFader>[];

  @override
  void initState() {
    super.initState();
    _chatBloc = ChatBloc(repository: widget.repository);
    _chatBloc.dispatch(Fetch());
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }

  void _populateChatMessages(List<Message> messages) {
    var messeg = _findDifferentMessages(messages);
    _chatMessages.addAll(messeg);
  }

  Iterable<ChatMessageFader> _findDifferentMessages(List<Message> messages) {
    var mes = messages.where((message) {
      if (_chatMessages
              .where((cm) => cm.chatMessage.message.id == message.id).isEmpty) {
        return true;
      }
      return false;
    });
    var cmes = <ChatMessageFader>[];
    for (var m in mes) {
      cmes.add(ChatMessageFader(chatMessage: ChatMessage(message: m)));
    }
    return cmes;
  }

  Widget _chatComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat | Vicinia")),
      body: Column(
        children: <Widget>[
          Flexible(
            child: BlocBuilder(
              bloc: _chatBloc,
              builder: (BuildContext context, ChatState state) {
                if (state is InitialChatState) {
                  return Center(
                    child: Container(
                      child: Text("Welcome to Valincia!"),
                    ),
                  );
                }
                if (state is LoadingChatState) {
                  return Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is LoadedChatState) {
                  _populateChatMessages(state.messages);
                  return ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (context, int index) {
                      // return FadeIn(
                      //   .5 + ((state.messages.length - index) * .2),
                      //   ChatMessage(
                      //     message: state.messages[index],
                      //   ),
                      // );
                      var fader = _chatMessages[index];
                      if (fader.faded) {
                        return fader.chatMessage;
                      } else {
                        fader.faded = true;
                        return FadeIn(.5, fader.chatMessage);
                      }
                    },
                    itemCount: _chatMessages.length,
                  );
                }
                if (state is ErrorChatState) {
                  return Center(
                    child: Container(
                      child: Text("there was an error :("),
                    ),
                  );
                }
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            //new
            decoration:
                new BoxDecoration(color: Theme.of(context).cardColor), //new
            child: _chatComposer(), //modified
          ),
        ],
      ),
    );
  }
}
