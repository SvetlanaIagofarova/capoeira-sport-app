abstract interface class CommonLocalDataSourceMethods<TypeModel> {
  Future<List<TypeModel>> getLastTypeModelList();

  Future<void> cacheTypeModelList(List<TypeModel> typeModelListToCache);
}
