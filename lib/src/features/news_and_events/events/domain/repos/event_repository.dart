import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';

abstract interface class EventRepository {
  Future<Result<List<Event>, Error>> getEventList();
}