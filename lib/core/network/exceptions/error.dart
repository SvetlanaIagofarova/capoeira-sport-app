import 'package:equatable/equatable.dart';

abstract class Error extends Equatable {
}

// General failures
class ServerError extends Error {

  @override
  List<Object?> get props => [];
}

class CacheError extends Error {
  @override
  List<Object?> get props => [];
}