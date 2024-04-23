import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';

class EventLocalDataSourceImpl<EventModel> implements CommonLocalDataSource<EventModel> {
  final HiveService _hiveService;

  EventLocalDataSourceImpl({
    required HiveService hiveService,
  }) : _hiveService = hiveService;

  @override
  BoxType get boxType => BoxType.eventList;

  @override
  Future<void> cacheTypeModelList(List<EventModel> eventListToCache) {
    return _hiveService.saveThings(
      boxType: boxType,
      value: eventListToCache,
    );
  }

  @override
  Future<List<EventModel>> getLastTypeModelList() {
    final List<EventModel>? lastEventList =
        _hiveService.getAllThings(boxType: boxType);

    if (lastEventList != null) {
      return Future.value(lastEventList);
    } else {
      throw CacheException();
    }
  }
}
