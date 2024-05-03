import 'dart:convert';

import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_result_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../fixtures/fixture_reader.dart';

void main() {
  const tNewsResultModel = [
    NewsModel(id: 1, title: 'News Title', date: 'News Date', url: 'News url'),
  ];

  test(
    'should return data from NewsModel',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        fixture('result.json'),
      );

      //act
      final result = NewsResultModel.fromJson(jsonMap).data;

      //assert
      expect(result, tNewsResultModel);
    },
  );
}
