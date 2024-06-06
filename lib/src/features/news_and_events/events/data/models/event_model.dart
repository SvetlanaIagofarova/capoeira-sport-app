import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends Event {
  const EventModel({
    required super.id,
    required super.title,
    required super.imgUrl,
    required super.url,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
