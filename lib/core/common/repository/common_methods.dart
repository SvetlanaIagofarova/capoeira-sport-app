abstract interface class CommonMethodsRepository<T> {
  Future<List<T>> getListOfThings();

  Future<T> getThing({
    required int id,
  });

  Future<T> postThing({
    required T body,
  });

  Future<T> putThing({
    required int id,
    required T body,
  });

  Future<void> deleteThing({
    required int id,
  });
}