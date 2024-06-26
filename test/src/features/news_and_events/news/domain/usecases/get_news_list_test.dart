import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/usecases/get_news_list.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'get_news_list_test.mocks.dart';

@GenerateMocks([NewsRepository])
void main() {
  final fakeNewsList = <News>[
    const News(id: 1, title: 'title1', date: 'date1', url: 'url1'),
    const News(id: 2, title: 'title2', date: 'date2', url: 'url2'),
  ];
  provideDummy<Result<List<News>, Exception>>(
    Success(value: fakeNewsList),
  );
  test(
    'should get list of news from the repository',
    () async {
      //arrange
      final mockNewsRepository = MockNewsRepository();
      final usecase = GetNewsList(mockNewsRepository);

      when(
        mockNewsRepository.getNewsList(),
      ).thenAnswer(
        (_) async => Success(value: fakeNewsList),
      );
      //act
      final result = await usecase(NoParams());
      //assert
      // UseCase should simply return whatever was returned from the Repository
      expect(
        result,
        Success(value: fakeNewsList),
      );
      // Verify that the method has been called on the Repository
      verify(
        mockNewsRepository.getNewsList(),
      );
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNewsRepository);
    },
  );
}
