import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: EventRepository)
class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSourceImpl remoteDataSource;
  final EventLocalDataSourceImpl localDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    @Named.from(EventRemoteDataSourceImpl) required this.remoteDataSource,
    @Named.from(EventLocalDataSourceImpl) required this.localDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Result<List<Event>, Exception>> getEventList() async {
    if (await networkInfo.isConnected) {
      try {
        final List<Event> remoteEventList = await remoteDataSource.getListOfThings();
        localDataSource.cacheTypeModelList(remoteEventList as List<EventModel>);
        return Success(value: remoteEventList);
      } on ServerException {
        return Failure(
          exception: ServerException(),
        );
      }
    } else {
      try {
        final List<Event> localEventList = await localDataSource.getLastTypeModelList();
        return Success(value: localEventList);
      } on CacheException {
        return Failure(
          exception: CacheException(),
        );
      }
    }
  }
}



  