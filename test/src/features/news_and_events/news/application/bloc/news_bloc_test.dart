import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/application/bloc/news_bloc.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/usecases/get_news_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([GetNewsList])
void main() {
  group(
    NewsBloc,
    () {
      late NewsBloc newsBloc;
      late MockGetNewsList mockGetNewsList;

      final fakeNewsList = <News>[
        const News(id: 1, title: 'title1', date: 'date1', url: 'url1'),
        const News(id: 2, title: 'title2', date: 'date2', url: 'url2'),
      ];
      provideDummy<Result<List<News>, Exception>>(
        Success(value: fakeNewsList),
      );

      setUp(() {
        mockGetNewsList = MockGetNewsList();
        newsBloc = NewsBloc(getNewsList: mockGetNewsList);
      });
      final expectedSuccess = [
        NewsLoadInProgress(),
        NewsLoadSuccess(
          newsList: fakeNewsList,
        ),
      ];
      final expectedFailure = [
        NewsLoadInProgress(),
        NewsLoadFailure(
          message: CacheException().errorMessage,
        )
      ];

      blocTest(
        'shoud get data from the concrete usecase',
        setUp: () {
          when(mockGetNewsList(any)).thenAnswer(
            (_) async => Success(value: fakeNewsList),
          );
        },
        build: () => newsBloc,
        act: (bloc) => bloc.add(
          NewsLoadList(),
        ),
        verify: (_) {
          verify(mockGetNewsList(NoParams()));
        },
      );

      blocTest(
        'should emit [LoadingInProgress, LoadSuccess] when data is gotten successfully',
        setUp: () {
          when(mockGetNewsList(any)).thenAnswer(
            (_) async => Success(value: fakeNewsList),
          );
        },
        build: () => newsBloc,
        act: (bloc) => bloc.add(
          NewsLoadList(),
        ),
        expect: () => expectedSuccess,
      );

      blocTest(
        'should emit [LoadingInProgress, LoadFailure] when data is gotten successfully',
        setUp: () {
          when(mockGetNewsList(any)).thenAnswer(
            (_) async => Failure(
              exception: CacheException(),
            ),
          );
        },
        build: () => newsBloc,
        act: (bloc) => bloc.add(
          NewsLoadList(),
        ),
        expect: () => expectedFailure,
      );
    },
  );
}
