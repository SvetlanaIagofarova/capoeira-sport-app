import 'package:bloc/bloc.dart';
import 'package:capoeirasport_project/core/common/extensions.dart';
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/usecases/get_event_list.dart';
import 'package:equatable/equatable.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetEventList getEventList;

  EventBloc({
    required this.getEventList,
  }) : super(EventInitial()) {
    on<EventLoadList>(_loadEventListEventHandler);
  }

  Future<void> _loadEventListEventHandler(
    EventEvent event,
    Emitter<EventState> emit,
  ) async {
    emit(
      EventLoadInProgress(),
    );
    final eventResult = await getEventList(
      NoParams(),
    );

    emit(
      switch (eventResult) {
        Success(value: final eventList) =>
          EventLoadSuccess(eventList: eventList),
        Failure(exception: final exception) => EventLoadFailure(
            message: ExceptionMesage(exception).message,
          ),
      },
    );
  }
}
