import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/common/repository/common_remote_repository.dart';
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final CommonRemoteRepository<EventModel> remoteDataSource;
  final CommonLocalDataSource<Event> localDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
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



  