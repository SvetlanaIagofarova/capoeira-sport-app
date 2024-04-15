import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:equatable/equatable.dart';

abstract interface class UseCase<T, Params> {
  Future<Result<T, Error>> call(Params params);
}

final class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
