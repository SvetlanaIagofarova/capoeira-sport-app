import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';

abstract class EventRemoteDataSource {
  /// Calls the https://capoeirasport.com/getMobileEvents endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<EventModel>> getEventList();
}