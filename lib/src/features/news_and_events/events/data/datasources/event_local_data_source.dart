import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';

abstract class EventLocalDataSource {
  /// Gets the cached [EventModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<EventModel>> getLastEventList();

  Future<void> cacheEventList(List<EventModel> eventListToCache);
}