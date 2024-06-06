import 'package:capoeirasport_project/src/features/schools/data/models/gradation_colors_model.dart';
import 'package:capoeirasport_project/src/features/schools/domain/entities/gradation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gradation_model.g.dart';

@JsonSerializable()
class GradationModel extends Gradation {
  const GradationModel({
    required super.name,
    required Map<String, GradationColorsModel> super.colors,
  });

  @override
  Map<String, GradationColorsModel> get colors =>
      super.colors as Map<String, GradationColorsModel>;

  factory GradationModel.fromJson(Map<String, dynamic> json) =>
      _$GradationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GradationModelToJson(this);

  // factory GradationModel fromJson(Map<String, dynamic> json) 
  //     {
  //       return GradationModel (
  //         name: json['name'],
  //         colors: colors.,
  //       );
  //     };

  // Map<String, dynamic> toJson() => ;
}
 /*
Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'lastLogin': lastLogin.toIso8601String(),
      };

  static Profile fromJson(Map<String, dynamic> json) {
    return Profile(
      user: User.fromJson(json['user']),
      lastLogin: DateTime.parse(json['lastLogin']),
    );
  }
}
 */