import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';

class EventModel extends Event {
  const EventModel({
    required super.id,
    required super.title,
    required super.imgUrl,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['Id'],
      title: json['Title'],
      imgUrl: json['imgUrl'],
    );
  }
}
