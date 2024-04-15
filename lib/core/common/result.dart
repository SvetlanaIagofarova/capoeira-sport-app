import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:equatable/equatable.dart';

sealed class Result<S, E extends Error> extends Equatable {
  const Result();
}

final class Success<S, E extends Error> extends Result<S, E> {
  const Success({required this.value});
  final S value;

  @override
  List<Object?> get props => [];
}

final class Failure<S, E extends Error> extends Result<S, E> {
  const Failure({required this.failure});
  final Error failure;

  @override
  List<Object?> get props => [];
}

extension ResultExtension on Result<dynamic, Error> {
  dynamic unwrap() {
    if (this is Success) {
      return (this as Success).value;
    } else {
      throw (this as Failure).failure;
    }
  }
}
