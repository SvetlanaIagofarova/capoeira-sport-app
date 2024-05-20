import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/schools/domain/entities/school.dart';
import 'package:capoeirasport_project/src/features/schools/domain/repos/schools_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: UseCase<List<School>, Params>)
class GetParticularSchool implements UseCase<List<School>, Params> {
  final SchoolsRepository repository;

  const GetParticularSchool(this.repository);

  @override
  Future<Result<List<School>, Exception>> call(Params params) async {
    return await repository.getParticularSchool(params.id);
  }
}

@injectable
final class Params extends Equatable {
  final int id;

  const Params({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
