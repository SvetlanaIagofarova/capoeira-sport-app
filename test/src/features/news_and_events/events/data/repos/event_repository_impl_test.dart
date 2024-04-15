import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:capoeirasport_project/core/exceptions/exception.dart';
import 'package:capoeirasport_project/core/utils/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/repos/event_repository_impl.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_repository_impl_test.mocks.dart';

@GenerateMocks([EventRemoteDataSource])
@GenerateMocks([EventLocalDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  late EventRepositoryImpl repository;
  late EventRemoteDataSource mockEventRemoteDataSource;
  late EventLocalDataSource mockEventLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockEventRemoteDataSource = MockEventRemoteDataSource();
    mockEventLocalDataSource = MockEventLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = EventRepositoryImpl(
      remoteDataSource: mockEventRemoteDataSource,
      localDataSource: mockEventLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const fakeEventListModel = <EventModel>[
    EventModel(id: 1, title: 'title1', imgUrl: 'imgUrl1'),
    EventModel(id: 2, title: 'title2', imgUrl: 'imgUrl2'),
  ];
  const List<Event> fakeEventList = fakeEventListModel;
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
          when(mockEventRemoteDataSource.getEventList())
              .thenAnswer((_) async => fakeEventListModel);
          //act
          final result = await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getEventList());
          expect(
            result,
            equals(
              const Success<List<Event>, Error>(value: fakeEventList),
            ),
          );
        },
      );
      test(
        'should cache the data locally when the call to the remote data source is succesful',
        () async {
          //arrange
          when(mockEventRemoteDataSource.getEventList())
              .thenAnswer((_) async => fakeEventListModel);
          //act
          await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getEventList());
          verify(
            mockEventLocalDataSource
                .cacheEventList(fakeEventList as List<EventModel>),
          );
        },
      );
      test(
        'should return ServerError when the call to the remote data source is unsuccesful',
        () async {
          //arrange
          when(mockEventRemoteDataSource.getEventList()).thenThrow(
            ServerException(),
          );
          //act
          final result = await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getEventList());
          verifyNoMoreInteractions(mockEventLocalDataSource);
          expect(
            result,
            equals(
              Failure<List<Event>, Error>(
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
          when(mockEventLocalDataSource.getLastEventList())
              .thenAnswer((_) async => fakeEventListModel);
          //act
          final result = await repository.getEventList();
          //assert
          verifyNoMoreInteractions(mockEventRemoteDataSource);
          verify(mockEventLocalDataSource.getLastEventList());
          expect(
            result,
            equals(
              const Success<List<Event>, Error>(value: fakeEventList),
            ),
          );
        },
      );
      test(
        'should return CacheError when the call to the local data source is unsuccesful',
        () async {
          //arrange
          when(
            mockEventLocalDataSource.getLastEventList(),
          ).thenThrow(
            CacheException(),
          );
          //act
          final result = await repository.getEventList();
          //assert
          verifyNoMoreInteractions(mockEventRemoteDataSource);
          verify(mockEventLocalDataSource.getLastEventList());
          expect(
            result,
            equals(
              Failure<List<Event>, Error>(
                failure: CacheError(),
              ),
            ),
          );
        },
      );
    },
  );
}
