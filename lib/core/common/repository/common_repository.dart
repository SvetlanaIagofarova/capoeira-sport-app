import 'package:capoeirasport_project/core/common/repository/common_methods.dart';
import 'package:capoeirasport_project/core/exceptions/dio_exceptions.dart';
import 'package:capoeirasport_project/core/network/dio_client.dart';
import 'package:dio/dio.dart';

abstract class CommonRepository<T> implements CommonMethodsRepository<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(T body);

  String get path;

  @override
  Future<List<T>> getListOfThings() async {
    try {
      final response = await DioClient.instance.get(
        path,
      );
      return (response as List).map((e) => fromJson(e)).toList();
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<T> getThing({
    required int id,
  }) async {
    try {
      final response = await DioClient.instance.get(
        '$path/$id',
      );
      return fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<T> postThing({
    required T body,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path,
        data: toJson(body),
      );
      return fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<T> putThing({
    required int id,
    required T body,
  }) async {
    try {
      final response = await DioClient.instance.put(
        '$path/$id',
        data: toJson(body),
      );
      return fromJson(response);
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<void> deleteThing({required int id}) async {
    try {
      await DioClient.instance.delete(
        '$path/$id',
      );
    } on DioException catch (e) {
      var error = DioExceptions.fromDioException(e);
      throw error.errorMessage;
    }
  }
}