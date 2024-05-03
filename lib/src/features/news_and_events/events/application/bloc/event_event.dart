import 'package:equatable/equatable.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class EventLoadList extends EventEvent {}
