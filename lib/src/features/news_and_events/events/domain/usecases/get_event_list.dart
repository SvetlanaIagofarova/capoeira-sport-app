import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';

final class GetEventList implements UseCase<List<Event>, NoParams>{
  final EventRepository _repository;

  const GetEventList(this._repository);
  
  @override
  Future<Result<List<Event>, Error>> call(NoParams params) async {
    return await _repository.getEventList();
  }
}
