import 'package:capoeirasport_project/core/common/repository/common_remote_repository.dart';
import 'package:capoeirasport_project/src/consts/api_path_consts.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';

class EventRemoteDataSourceImpl extends CommonRemoteRepository<EventModel> {
  EventRemoteDataSourceImpl({required super.client});

  @override
  EventModel fromJson(Map<String, dynamic> json) => EventModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(EventModel body) => body.toJson();

  @override
  String get path => ApiPathsConsts.eventListPath;
}
