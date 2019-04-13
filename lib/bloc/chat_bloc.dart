import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'bloc.dart';

import '../models/models.dart';
import '../utils/utils.dart';
import '../repository/repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ViciniaRepository repository;
  Location location;

  ChatBloc({@required this.repository}) {
    _updateLocation();
  }

  Future<void> _updateLocation() async {
    location = await getCurrentLocation();
  }

  @override
  ChatState get initialState => InitialChatState();

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is InitialChatState) {
          final messages = await _fetchMessages();
          yield LoadedChatState(messages: messages, hasReachedMax: false);
          return;
        }
        if (currentState is LoadedChatState) {
          // TODO make it so we don't fetch ALL messages each time
          final messages = await _fetchMessages();
          yield LoadedChatState(messages: messages, hasReachedMax: false);
          return;
        }
      } catch (_) {
        yield ErrorChatState();
      }
    }
  }

  bool _hasReachedMax(ChatState state) =>
      state is LoadedChatState && state.hasReachedMax;

  Future<List<Message>> _fetchMessages() async {
    if (location == null) {
      await _updateLocation();
    }
    var messages = await repository.getMessages(location);
    return messages;
  }
}
