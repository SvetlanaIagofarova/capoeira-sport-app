import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';
import 'package:injectable/injectable.dart';

@named
@Singleton(as: UseCase<List<News>, NoParams>)
class GetNewsList implements UseCase<List<News>, NoParams> {
  final NewsRepository repository;

  const GetNewsList(this.repository);

  @override
  Future<Result<List<News>, Exception>> call(NoParams params) async {
    return await repository.getNewsList();
  }
}
