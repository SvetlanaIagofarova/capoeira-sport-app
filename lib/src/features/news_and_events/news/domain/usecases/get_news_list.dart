import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';

final class GetNewsList {
  final NewsRepository _repository;

  const GetNewsList(this._repository);

  Future<Result<List<News>, Exception>> loadList() async {
    return await _repository.getNewsList();
  }
}
