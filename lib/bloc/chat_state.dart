import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

@immutable
abstract class ChatState extends Equatable {
  ChatState([List props = const []]) : super(props);
}

class InitialChatState extends ChatState {
  @override
  String toString() => 'InitialChatState';
}

class EmptyChatState extends ChatState {
  @override
  String toString() => 'EmptyChatState';
}

class LoadingChatState extends ChatState {
  @override
  String toString() => 'LoadingChatState';
}

class LoadedChatState extends ChatState {
  final List<Message> messages;
  final bool hasReachedMax;

  LoadedChatState({this.messages, this.hasReachedMax})
      : super([messages, hasReachedMax]);

  LoadedChatState copyWith({List<Message> messages, bool hasReachedMax}) {
    return LoadedChatState(
        messages: messages ?? this.messages,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() =>
      'LoadedChatState { messages: ${messages.length}, hasReachedMax: $hasReachedMax }';
}

class ErrorChatState extends ChatState {
  @override
  String toString() => 'ErrorChatState';
}
