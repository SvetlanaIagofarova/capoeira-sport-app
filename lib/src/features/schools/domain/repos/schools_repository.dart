import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/src/features/schools/domain/entities/school.dart';

abstract interface class SchoolsRepository {
  Future<Result<List<School>, Exception>> getSchoolsList();

  Future<Result<List<School>, Exception>> getParticularSchool(int id);
}