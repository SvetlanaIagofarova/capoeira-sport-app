import 'dart:convert';

import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  const tNewsModel = EventModel(
      id: 2, title: 'Event Title', imgUrl: 'Event imgUrl', url: 'Event url');

  test(
    'should be a subclass of the Event entity',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('event.json'),
      );

      //act
      final result = EventModel.fromJson(jsonMap);

      //assert
      expect(result, tNewsModel);
    },
  );
}
