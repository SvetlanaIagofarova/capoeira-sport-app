import 'package:capoeirasport_project/src/features/schools/data/models/gradation_model.dart';
import 'package:capoeirasport_project/src/features/schools/domain/entities/school.dart';
import 'package:json_annotation/json_annotation.dart';


part 'school_model.g.dart';

@JsonSerializable()
class SchoolModel extends School {
  const SchoolModel({
    required super.id,
    required super.name,
    required Map<String, GradationModel> super.gradation,
  });

  @override
  Map<String, GradationModel> get gradation => super.gradation as Map<String, GradationModel>;

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolModelToJson(this);
}
