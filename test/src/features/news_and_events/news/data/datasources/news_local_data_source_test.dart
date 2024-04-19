import 'package:capoeirasport_project/core/network/exceptions/exception.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_local_data_source_test.mocks.dart';

@GenerateMocks([HiveService])
void main() {
  late NewsLocalDataSourceImpl dataSource;
  late MockHiveService mockHiveService;

  const fakeNewsListModel = <NewsModel>[
    NewsModel(id: 1, title: 'title1', date: 'date1'),
    NewsModel(id: 2, title: 'title2', date: 'date2'),
  ];

  setUp(() {
    mockHiveService = MockHiveService();
    dataSource = NewsLocalDataSourceImpl(hiveService: mockHiveService);
  });

  group(
    'getLastNewsList',
    () {
      test(
        'should return NewsList from HiveService when there is one in the cache',
        () async {
          //arrange
          when(
            mockHiveService.getAllThings(boxType: dataSource.boxType),
          ).thenReturn(fakeNewsListModel);
          //act
          final result = await dataSource.getLastTypeModelList();
          //assert
          verify(
            mockHiveService.getAllThings(
              boxType: dataSource.boxType,
            ),
          );
          expect(result, equals(fakeNewsListModel));
        },
      );

      test(
        'should should throw a CacheException when there is not a cached value',
        () async {
          //arrange
          when(
            mockHiveService.getAllThings(boxType: dataSource.boxType),
          ).thenThrow(
            CacheException(),
          );
          //act
          final call = dataSource.getLastTypeModelList;
          //assert
          expect(
            () => call(),
            throwsA(
              const TypeMatcher<CacheException>(),
            ),
          );
        },
      );
    },
  );

  group('cache NewsList', () {
    test(
      'should call HiveService to cashe the data',
      () async {
        //act
        dataSource.cacheTypeModelList(fakeNewsListModel);
        //assert
        verify(
          mockHiveService.saveThings(
              boxType: dataSource.boxType, value: fakeNewsListModel),
        );
      },
    );
  });
}
