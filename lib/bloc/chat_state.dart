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
  final Location location;
  final bool hasReachedMax;
  final String placemark;

  LoadedChatState(
      {this.messages, this.hasReachedMax, this.location, this.placemark})
      : super([messages, hasReachedMax, location]);

  LoadedChatState copyWith(
      {List<Message> messages,
      bool hasReachedMax,
      Location location,
      String placemark}) {
    return LoadedChatState(
        messages: messages ?? this.messages,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        location: location ?? this.location,
        placemark: placemark ?? this.placemark);
  }

  @override
  String toString() =>
      'LoadedChatState { messages: ${messages.length}, hasReachedMax: $hasReachedMax }';
}

class ErrorChatState extends ChatState {
  @override
  String toString() => 'ErrorChatState';
}
