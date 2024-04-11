import 'package:equatable/equatable.dart';

sealed class Result<S, E extends Exception> extends Equatable {
  const Result();
}

final class Success<S, E extends Exception> extends Result<S, E> {
  const Success({required this.value});
  final S value;

  @override
  List<Object?> get props => [];
}

final class Failure<S, E extends Exception> extends Result<S, E> {
  const Failure({required this.exception});
  final E exception;

  @override
  List<Object?> get props => [];

  /*
  extension ResultExtension on Result<dynamic, Exception> {
  dynamic unwrap() {
    if (this is Success) {
      return (this as Success).value;
    } else {
      throw (this as Failure).exception;
    }
  }
  */
}
