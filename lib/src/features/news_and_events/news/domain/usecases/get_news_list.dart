import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';

final class GetNewsList implements UseCase<List<News>, NoParams> {
  final NewsRepository _repository;

  const GetNewsList(this._repository);

  @override
  Future<Result<List<News>, Error>> call(NoParams params) async {
    return await _repository.getNewsList();
  }
}
