import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../repository/repository.dart';
import '../widgets/widgets.dart';
import '../animations/animations.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class ChatPage extends StatefulWidget {
  final ViciniaRepository repository;
  final String name;

  const ChatPage({Key key, @required this.repository, @required this.name})
      : super(key: key);

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
    _chatBloc = ChatBloc(repository: widget.repository, username: widget.name);
    _chatBloc.dispatch(Fetch());
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _chatBloc.dispatch(Send(message: text));
      _textController.clear();
    }
  }

  void _populateChatMessages(List<Message> messages) {
    if (messages != null) {
      var messeg = _findDifferentMessages(messages);
      _chatMessages.insertAll(0, messeg);
    }
    //_chatMessages = _chatMessages.reversed.toList();
  }

  Iterable<ChatMessageFader> _findDifferentMessages(List<Message> messages) {
    if (messages == null || _chatMessages == null) {
      return <ChatMessageFader>[];
    }
    var mes = messages.where((message) {
      if (_chatMessages
          .where((cm) => cm.chatMessage.message.id == message.id)
          .isEmpty) {
        return true;
      }
      return false;
    });
    var cmes = <ChatMessageFader>[];
    for (var m in mes) {
      cmes.add(ChatMessageFader(
          chatMessage: ChatMessage(
        message: m,
        incoming: (widget.name == m.name) ? false : true,
      )));
    }
    return cmes;
  }

  Widget _chatComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  maxLength: 280,
                  maxLengthEnforced: true,
                  keyboardType: TextInputType.multiline,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mainLayout({Widget child, ChatState state}) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icon/icon_white.png"),
        title: state is LoadedChatState ? Text("${state.placemark}") : Text(""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _chatMessages = [];
              _chatBloc.dispatch(Refresh());
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: child,
          ),
          Divider(height: 1.0),
          Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _chatComposer(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _chatBloc,
      builder: (BuildContext context, ChatState state) {
        if (state is EmptyChatState) {
          return _mainLayout(
              child: Center(
                child: Container(
                  child: Text("no messages :("),
                ),
              ),
              state: state);
        }
        if (state is InitialChatState) {
          return _mainLayout(
              child: Center(
                child: Container(
                  child: Text("Welcome to Valincia!"),
                ),
              ),
              state: state);
        }
        if (state is LoadingChatState) {
          return _mainLayout(
              child: Center(
                child: Container(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
              state: state);
        }
        if (state is LoadedChatState) {
          _populateChatMessages(state.messages);
          return _mainLayout(
              child: ListView.builder(
                // controller: _scrollController,
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (context, int index) {
                  var fader = _chatMessages[index];
                  if (fader.faded) {
                    return fader.chatMessage;
                  } else {
                    fader.faded = true;
                    return FadeIn(.5, fader.chatMessage);
                  }
                },
                itemCount: _chatMessages.length,
              ),
              state: state);
        }
        if (state is ErrorChatState) {
          return _mainLayout(
              child: Center(
                child: Container(
                  child: Text("there was an error :("),
                ),
              ),
              state: state);
        }
      },
    );
  }

  @override
  void dispose() {
    _chatBloc.dispose();
    super.dispose();
  }
}
