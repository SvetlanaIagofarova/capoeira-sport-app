import 'package:capoeirasport_project/core/common/result.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

abstract interface class UseCase<T, Params> {
  Future<Result<T, Exception>> call(Params params);
}

@injectable
final class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
