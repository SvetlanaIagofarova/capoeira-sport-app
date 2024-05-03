import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources_methods.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';

abstract class CommonLocalDataSource<TypeModel>
    implements CommonLocalDataSourceMethods<TypeModel> {
  CommonLocalDataSource({
    required HiveService hiveService,
  }) : _hiveService = hiveService;

  final HiveService _hiveService;

  BoxType get boxType;

  /// Gets the cached [TypeModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  @override
  Future<List<TypeModel>> getLastTypeModelList() {
    final List<TypeModel>? lastEventList =
        _hiveService.getAllThings(boxType: boxType);

    if (lastEventList != null) {
      return Future.value(lastEventList);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTypeModelList(
    List<TypeModel> typeModelListToCache,
  ) {
    return _hiveService.saveThings(
      boxType: boxType,
      value: typeModelListToCache,
    );
  }
}
