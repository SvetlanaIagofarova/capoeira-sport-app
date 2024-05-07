import 'package:capoeirasport_project/src/features/schools/domain/entities/gradation.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@HiveType(typeId: 5)
class School extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'Id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'Name')
  final String name;
  @HiveField(2)
  @JsonKey(name: 'Gradation')
  final Map<String, Gradation> gradation;

  const School({
    required this.id,
    required this.name,
    required this.gradation,
  });

  @override
  List<Object?> get props => [id, name, gradation];
}
