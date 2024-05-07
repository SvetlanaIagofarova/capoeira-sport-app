// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../../news_and_events/news/data/datasources/news_remote_data_source_test.mocks.dart';

// void main() {
//   late SchoolsRemoteDataSourceImpl dataSource;
//   late MockDioClient mockDioClient;

//   setUp(
//     () {
//       mockDioClient = MockDioClient();
//       dataSource = SchoolsRemoteDataSourceImpl(client: mockDioClient);
//     },
//   );

//   group(
//     'test school result',
//     () {
//       final dioGetListResponse = [
//         json.decode(
//           fixture('schools.json'),
//         )
//       ];
//       const fakeNewsListModel = <NewsModel>[
//         NewsModel(
//             id: 1, title: 'News Title', date: 'News Date', url: 'News url'),
//       ];

//       test(
//         'should ',
//         () async {
//           // arrange
//           when(mockDioClient.get(dataSource.path))
//               .thenAnswer((_) async => dioGetListResponse);

//           //act
//           final result = await dataSource.getListOfThings();

//           //assert
//           verify(mockDioClient.get(dataSource.path));
//           expect(
//             result,
//             equals(fakeNewsListModel),
//           );
//         },
//       );
//     },
//   );
// }
