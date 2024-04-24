import 'dart:convert';

import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  const tNewsModel =
      NewsModel(id: 1, title: 'News Title', date: 'News Date', url: 'News url');

  test(
    'should be a subclass of the News entity',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('news.json'),
      );

      //act
      final result = NewsModel.fromJson(jsonMap);

      //assert
      expect(result, tNewsModel);
    },
  );
}
