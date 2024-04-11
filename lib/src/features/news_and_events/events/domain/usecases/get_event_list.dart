import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';

final class GetEventList {
  final EventRepository _repository;

  const GetEventList(this._repository);

  Future<Result<List<Event>, Exception>> loadList() async {
    return await _repository.getEventList();
  }
}
