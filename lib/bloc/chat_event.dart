import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChatEvent extends Equatable {
  ChatEvent([List props = const []]) : super(props);
}

class Fetch extends ChatEvent {
  @override
  String toString() => 'Fetch';
}
