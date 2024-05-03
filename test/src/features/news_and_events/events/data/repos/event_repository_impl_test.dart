import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/datasources/event_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/models/event_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/data/repos/event_repository_impl.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_repository_impl_test.mocks.dart';

@GenerateMocks([EventRemoteDataSourceImpl])
@GenerateMocks([EventLocalDataSourceImpl])
@GenerateMocks([NetworkInfo])
void main() {
  late EventRepositoryImpl repository;
  late MockEventRemoteDataSourceImpl mockEventRemoteDataSource;
  late MockEventLocalDataSourceImpl mockEventLocalDataSource;
  late NetworkInfo mockNetworkInfo;

  setUp(() {
    mockEventRemoteDataSource = MockEventRemoteDataSourceImpl();
    mockEventLocalDataSource = MockEventLocalDataSourceImpl();
    mockNetworkInfo = MockNetworkInfo();
    repository = EventRepositoryImpl(
      remoteDataSource: mockEventRemoteDataSource,
      localDataSource: mockEventLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const fakeEventListModel = <EventModel>[
    EventModel(id: 1, title: 'title1', imgUrl: 'imgUrl1', url: 'url1'),
    EventModel(id: 2, title: 'title2', imgUrl: 'imgUrl2', url: 'url2'),
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
          when(
            mockEventRemoteDataSource.getListOfThings(),
          ).thenAnswer((_) async => fakeEventListModel);
          //act
          final result = await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getListOfThings());
          expect(
            result,
            equals(
              const Success<List<Event>, Exception>(value: fakeEventList),
            ),
          );
        },
      );
      test(
        'should cache the data locally when the call to the remote data source is succesful',
        () async {
          //arrange
          when(
            mockEventRemoteDataSource.getListOfThings(),
          ).thenAnswer((_) async => fakeEventListModel);
          //act
          await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getListOfThings());
          verify(
            mockEventLocalDataSource
                .cacheTypeModelList(fakeEventList as List<EventModel>),
          );
        },
      );
      test(
        'should return ServerError when the call to the remote data source is unsuccesful',
        () async {
          //arrange
          when(
            mockEventRemoteDataSource.getListOfThings(),
          ).thenThrow(
            ServerException(),
          );
          //act
          final result = await repository.getEventList();
          //assert
          verify(mockEventRemoteDataSource.getListOfThings());
          verifyNoMoreInteractions(mockEventLocalDataSource);
          expect(
            result,
            equals(
              Failure<List<Event>, Exception>(
                exception: ServerException(),
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
          when(mockEventLocalDataSource.getLastTypeModelList())
              .thenAnswer((_) async => fakeEventListModel);
          //act
          final result = await repository.getEventList();
          //assert
          verifyNoMoreInteractions(mockEventRemoteDataSource);
          verify(mockEventLocalDataSource.getLastTypeModelList());
          expect(
            result,
            equals(
              const Success<List<Event>, Exception>(value: fakeEventList),
            ),
          );
        },
      );
      test(
        'should return CacheError when the call to the local data source is unsuccesful',
        () async {
          //arrange
          when(
            mockEventLocalDataSource.getLastTypeModelList(),
          ).thenThrow(
            CacheException(),
          );
          //act
          final result = await repository.getEventList();
          //assert
          verifyNoMoreInteractions(mockEventRemoteDataSource);
          verify(mockEventLocalDataSource.getLastTypeModelList());
          expect(
            result,
            equals(
              Failure<List<Event>, Exception>(
                exception: CacheException(),
              ),
            ),
          );
        },
      );
    },
  );
}
