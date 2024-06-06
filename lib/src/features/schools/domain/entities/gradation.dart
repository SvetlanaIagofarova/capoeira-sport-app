
import 'package:capoeirasport_project/src/features/schools/domain/entities/gradation_colors.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradation.g.dart';

@HiveType(typeId: 3)
class Gradation extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'Name')
  final String name;
  @HiveField(1)
  @JsonKey(name: 'Colors')
  final Map<String, GradationColors> colors;

  const Gradation({
    required this.name,
    required this.colors,
  });

  @override
  List<Object?> get props => [name, colors];
}
