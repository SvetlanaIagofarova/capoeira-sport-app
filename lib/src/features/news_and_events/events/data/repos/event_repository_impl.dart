import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:capoeirasport_project/core/utils/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource remoteDataSource;
  final EventLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  EventRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
  @override
  Future<Result<List<Event>, Error>> getEventList() {
    throw UnimplementedError();
  }
}
