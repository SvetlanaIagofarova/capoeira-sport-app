abstract class ApiExceptionsConsts {
  static const String exceptionCancel = 'Request to the server was cancelled.';
  static const String exceptionConnectionTimeout = 'Connection timed out.';
  static const String exceptionReceiveTimeout = 'Receiving timeout occurred.';
  static const String exceptionSendTimeout = 'Request send timeout.';
  static const String socketException = 'SocketException';
  static const String exceptionNoInternet = 'No Internet.';
  static const String exceptionUnexpectedError = 'Unexpected error occurred.';
  static const String exceptionUnknown = 'Something went wrong :( ';
  static const String statusCode400 = 'Invalid request.';
  static const String statusCode404 = 'No object found.';
  static const String statusCode409 = 'Object already exists.';
  static const String statusCode500 = 'Internal server error.';
  static const String statusCodeDefaul = 'Oops something went wrong!';
}