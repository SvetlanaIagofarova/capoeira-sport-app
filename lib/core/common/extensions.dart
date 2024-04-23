import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';

extension ExceptionMesage on Exception {
  String get message {
    switch (runtimeType) {
      case const (ServerException):
        return ServerException().errorMessage;
      case const (CacheException):
        return CacheException().errorMessage;
      default:
        return 'Unexpected Error';
    }
  }
}