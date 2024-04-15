import 'package:capoeirasport_project/core/utils/hive_service.dart';

abstract interface class CommonLocalDataSource<TypeModel> {
  BoxType get boxType;

  /// Gets the cached [TypeModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<TypeModel>> getLastTypeModelList();

  Future<void> cacheTypeModelList(List<TypeModel> typeModelListToCache);
}
