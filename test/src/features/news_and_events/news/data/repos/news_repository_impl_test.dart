import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:capoeirasport_project/core/exceptions/exception.dart';
import 'package:capoeirasport_project/core/utils/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_local_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/repos/news_repository_impl.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_repository_impl_test.mocks.dart';

@GenerateMocks([NewsRemoteDataSource])
@GenerateMocks([NewsLocalDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  late NewsRepositoryImpl repository;
  late MockNewsRemoteDataSource mockNewsRemoteDataSource;
  late MockNewsLocalDataSource mockNewsLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNewsRemoteDataSource = MockNewsRemoteDataSource();
    mockNewsLocalDataSource = MockNewsLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NewsRepositoryImpl(
      remoteDataSource: mockNewsRemoteDataSource,
      localDataSource: mockNewsLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const fakeNewsListModel = <NewsModel>[
    NewsModel(id: 1, title: 'title1', date: 'date1'),
    NewsModel(id: 2, title: 'title2', date: 'date2'),
  ];
  const List<News> fakeNewsList = fakeNewsListModel;
  group(
    'device is online',
    () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer(
          (_) async => true,
        );
      });
      test(
        'should return remote data when the call to the remote data source is succesful',
        () async {
          //arrange
          when(mockNewsRemoteDataSource.getNewsList())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          final result = await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getNewsList());
          expect(
            result,
            equals(
              const Success<List<News>, Error>(value: fakeNewsList),
            ),
          );
        },
      );
      test(
        'should cache the data locally when the call to the remote data source is succesful',
        () async {
          //arrange
          when(mockNewsRemoteDataSource.getNewsList())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getNewsList());
          verify(
            mockNewsLocalDataSource
                .cacheNewsList(fakeNewsList as List<NewsModel>),
          );
        },
      );
      test(
        'should return ServerError when the call to the remote data source is unsuccesful',
        () async {
          //arrange
          when(mockNewsRemoteDataSource.getNewsList())
              .thenThrow(ServerException());
          //act
          final result = await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getNewsList());
          verifyNoMoreInteractions(mockNewsLocalDataSource);
          expect(
            result,
            equals(
              Failure<List<News>, Error>(
                failure: ServerError(),
              ),
            ),
          );
        },
      );
    },
  );

  group(
    'device is offline',
    () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer(
          (_) async => false,
        );
      });

      test(
        'should return last locally cached data when the cached data is present',
        () async {
          //arrange
          when(mockNewsLocalDataSource.getLastNewsList())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          final result = await repository.getNewsList();
          //assert
          verifyNoMoreInteractions(mockNewsRemoteDataSource);
          verify(mockNewsLocalDataSource.getLastNewsList());
          expect(
            result,
            equals(
              const Success<List<News>, Error>(value: fakeNewsList),
            ),
          );
        },
      );
      test(
        'should return CacheError when the call to the local data source is unsuccesful',
        () async {
          //arrange
          when(mockNewsLocalDataSource.getLastNewsList())
              .thenThrow(CacheException());
          //act
          final result = await repository.getNewsList();
          //assert
          verifyNoMoreInteractions(mockNewsRemoteDataSource);
          verify(mockNewsLocalDataSource.getLastNewsList());
          expect(
            result,
            equals(
              Failure<List<News>, Error>(
                failure: CacheError(),
              ),
            ),
          );
        },
      );
    },
  );
}
