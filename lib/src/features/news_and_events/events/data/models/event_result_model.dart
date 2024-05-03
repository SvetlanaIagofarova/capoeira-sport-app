import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EventResultModel extends EventResult {
  const EventResultModel({
    required super.status,
    required List<EventModel> super.data,
  });

  @override
  List<EventModel> get data => super.data as List<EventModel>;

  factory EventResultModel.fromJson(Map<String, dynamic> json) =>
      _$EventResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventResultModelToJson(this);
}
