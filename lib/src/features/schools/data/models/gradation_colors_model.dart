import 'package:capoeirasport_project/src/features/schools/domain/entities/gradation_colors.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradation_colors_model.g.dart';

@JsonSerializable()
class GradationColorsModel extends GradationColors {
  const GradationColorsModel({
    required super.c1,
    required super.c2,
    required super.c3,
    required super.c4,
    required super.k1,
    required super.k2,
  });


  factory GradationColorsModel.fromJson(Map<String, dynamic> json) =>
      _$GradationColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GradationColorsModelToJson(this);
}
