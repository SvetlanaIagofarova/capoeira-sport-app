import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/repos/event_repository.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/usecases/get_event_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_event_list_test.mocks.dart';

@GenerateMocks([EventRepository])
void main() {
  final fakeEventList = <Event>[
    const Event(id: 1, title: 'title1', imgUrl: 'imgUrl1'),
    const Event(id: 2, title: 'title2', imgUrl: 'imgUrl2'),
  ];

  provideDummy<Result<List<Event>, Error>>(
    Success(value: fakeEventList),
  );
  test(
    'should get list of news from the repository',
    () async {
      //arrange
      final mockEventRepository = MockEventRepository();
      final GetEventList usecase = GetEventList(mockEventRepository);

      when(
        mockEventRepository.getEventList(),
      ).thenAnswer(
        (_) async => Success(value: fakeEventList),
      );
      //act
      final result = await usecase(NoParams());
      //assert
      // UseCase should simply return whatever was returned from the Repository
      expect(
        result,
        Success(value: fakeEventList),
      );
      // Verify that the method has been called on the Repository
      verify(
        mockEventRepository.getEventList(),
      );
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockEventRepository);
    },
  );
}
