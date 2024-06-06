import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradation_colors.g.dart';

@HiveType(typeId: 4)
class GradationColors extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'c1')
  final String c1;

  @HiveField(1)
  @JsonKey(name: 'c2')
  final String c2;

  @HiveField(2)
  @JsonKey(name: 'c3')
  final String c3;

  @HiveField(3)
  @JsonKey(name: 'c4')
  final String c4;

  @HiveField(4)
  @JsonKey(name: 'k1')
  final String k1;

  @HiveField(5)
  @JsonKey(name: 'k2')
  final String k2;

  const GradationColors({
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.k1,
    required this.k2,
  });

  @override
  List<Object?> get props => [c1, c2, c3, c4, k1, k2];
}
