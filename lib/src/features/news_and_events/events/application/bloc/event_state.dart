part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();
  
  @override
  List<Object> get props => [];
}

final class EventInitial extends EventState {}

final class EventLoadInProgress extends EventState {}

final class EventLoadSuccess extends EventState {
  final List<Event> eventList;

  const EventLoadSuccess({required this.eventList});

  @override
  List<Object> get props => [eventList];
}

final class EventLoadFailure extends EventState {
  final String message;

  const EventLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
