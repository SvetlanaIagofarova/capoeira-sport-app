import 'package:capoeirasport_project/src/features/schools/domain/entities/school.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'schools_result.g.dart';

@HiveType(typeId: 4)
class SchoolsResult extends Equatable {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final Map<int, School> data;

  const SchoolsResult({
    required this.status,
    required this.data,
  });
  
  @override
  List<Object?> get props => [status, data];
}
