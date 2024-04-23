import 'dart:convert';
import 'package:capoeirasport_project/core/network/dio_client.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_remote_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../fixtures/fixture_reader.dart';
import 'news_remote_data_source_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late NewsRemoteDataSourceImpl dataSource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    dataSource = NewsRemoteDataSourceImpl(client: mockDioClient);
  });

  group(
    'getNewsList',
    () {
      final dioGetListResponse = [
        json.decode(
          fixture('news.json'),
        )
      ];
      const fakeNewsListModel = <NewsModel>[
        NewsModel(id: 1, title: 'News Title', date: 'News Date'),
      ];

      test(
        'should return List of NewsModel when the response code is success',
        () async {
          // arrange
          when(mockDioClient.get(dataSource.path))
              .thenAnswer((_) async => dioGetListResponse);

          //act
          final result = await dataSource.getListOfThings();

          //assert
          verify(mockDioClient.get(dataSource.path));
          expect(
            result,
            equals(fakeNewsListModel),
          );
        },
      );

      test(
        'should throw a DioException when the response code is unsuccess',
        () async {
          // arrange
          when(
            mockDioClient.get(dataSource.path),
          ).thenThrow(ServerException());

          // act
          final call = dataSource.getListOfThings; 
          
          // assert
          expect(
            () => call(),
            throwsA(
              const TypeMatcher<ServerException>(),
            ),
          );
        },
      );
    },
  );
}
