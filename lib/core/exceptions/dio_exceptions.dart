import 'package:dio/dio.dart';
import 'package:capoeirasport_project/src/consts/api_exceptions_consts.dart';

class DioExceptions implements Exception {
  late String errorMessage;

  DioExceptions.fromDioException(DioException dioEsception) {
    switch (dioEsception.type) {
      case DioExceptionType.cancel:
        errorMessage = ApiExceptionsConsts.exceptionCancel;
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = ApiExceptionsConsts.exceptionConnectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = ApiExceptionsConsts.exceptionReceiveTimeout;
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = ApiExceptionsConsts.exceptionSendTimeout;
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioEsception.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioEsception.message!
            .contains(ApiExceptionsConsts.socketException)) {
          errorMessage = ApiExceptionsConsts.exceptionNoInternet;
          break;
        }
        errorMessage = ApiExceptionsConsts.exceptionUnexpectedError;
        break;
      default:
        errorMessage = ApiExceptionsConsts.exceptionUnknown;
        break;
    }
  }
  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return ApiExceptionsConsts.statusCode400;
      case 404:
        return ApiExceptionsConsts.statusCode404;
      case 409:
        return ApiExceptionsConsts.statusCode409;
      case 500:
        return ApiExceptionsConsts.statusCode500;
      default:
        return ApiExceptionsConsts.statusCodeDefaul;
    }
  }

  @override
  String toString() => errorMessage;
}
