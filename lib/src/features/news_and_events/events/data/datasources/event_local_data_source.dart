import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: CommonLocalDataSource)
class EventLocalDataSourceImpl
    extends CommonLocalDataSource<EventModel> {
  EventLocalDataSourceImpl({required super.hiveService});

  @override
  BoxType get boxType => BoxType.eventList;
}
