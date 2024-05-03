import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'event_result.g.dart';

@HiveType(typeId: 3)
class EventResult extends Equatable {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final List<Event> data;

  const EventResult({
    required this.status,
    required this.data,
  });
  
  @override
  List<Object?> get props => [status, data];
}
