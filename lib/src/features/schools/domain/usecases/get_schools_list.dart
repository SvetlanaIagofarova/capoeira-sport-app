import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/schools/domain/entities/school.dart';
import 'package:capoeirasport_project/src/features/schools/domain/repos/schools_repository.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: UseCase<List<School>, NoParams>)
class GetSchoolsList implements UseCase<List<School>, NoParams> {
  final SchoolsRepository repository;

  const GetSchoolsList(this.repository);

  @override
  Future<Result<List<School>, Exception>> call(NoParams params) async {
    return await repository.getSchoolsList();
  }
}
