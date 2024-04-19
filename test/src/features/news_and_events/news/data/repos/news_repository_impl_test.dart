import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/common/repository/common_remote_repository.dart';
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/core/network/exceptions/exception.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/repos/news_repository_impl.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_repository_impl_test.mocks.dart';

@GenerateMocks([CommonRemoteRepository<NewsModel>])
@GenerateMocks([CommonLocalDataSource<News>])
@GenerateMocks([NetworkInfo])
void main() {
  late NewsRepositoryImpl repository;
  late MockCommonRemoteRepository<NewsModel> mockNewsRemoteDataSource;
  late MockCommonLocalDataSource<News> mockNewsLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNewsRemoteDataSource = MockCommonRemoteRepository<NewsModel>();
    mockNewsLocalDataSource = MockCommonLocalDataSource();
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
          when(mockNewsRemoteDataSource.getListOfThings())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          final result = await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getListOfThings());
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
          when(mockNewsRemoteDataSource.getListOfThings())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getListOfThings());
          verify(
            mockNewsLocalDataSource
                .cacheTypeModelList(fakeNewsList as List<NewsModel>),
          );
        },
      );
      test(
        'should return ServerError when the call to the remote data source is unsuccesful',
        () async {
          //arrange
          when(mockNewsRemoteDataSource.getListOfThings()).thenThrow(
            ServerException(),
          );
          //act
          final result = await repository.getNewsList();
          //assert
          verify(mockNewsRemoteDataSource.getListOfThings());
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
          when(mockNewsLocalDataSource.getLastTypeModelList())
              .thenAnswer((_) async => fakeNewsListModel);
          //act
          final result = await repository.getNewsList();
          //assert
          verifyNoMoreInteractions(mockNewsRemoteDataSource);
          verify(mockNewsLocalDataSource.getLastTypeModelList());
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
          when(
            mockNewsLocalDataSource.getLastTypeModelList(),
          ).thenThrow(
            CacheException(),
          );
          //act
          final result = await repository.getNewsList();
          //assert
          verifyNoMoreInteractions(mockNewsRemoteDataSource);
          verify(mockNewsLocalDataSource.getLastTypeModelList());
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
