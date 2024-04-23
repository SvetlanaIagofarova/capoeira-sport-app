import 'package:capoeirasport_project/core/common/result.dart';
import 'package:equatable/equatable.dart';

abstract interface class UseCase<T, Params> {
  Future<Result<T, Exception>> call(Params params);
}

final class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
