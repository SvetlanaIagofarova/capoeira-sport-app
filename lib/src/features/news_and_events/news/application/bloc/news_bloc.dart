import 'dart:async';
import 'package:capoeirasport_project/core/common/extensions.dart';
import 'package:bloc/bloc.dart';
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/common/usecase.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/usecases/get_news_list.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsList getNewsList;

  NewsBloc({
    required this.getNewsList,
  }) : super(NewsInitial()) {
    on<NewsLoadList>(_loadNewsListEventHandler);
  }

  Future<void> _loadNewsListEventHandler(
    NewsEvent event,
    Emitter<NewsState> emit,
  ) async {
    emit(
      NewsLoadInProgress(),
    );
    final newsResult = await getNewsList(
      NoParams(),
    );

    emit(
      switch (newsResult) {
        Success(value: final newsList) => NewsLoadSuccess(newsList: newsList),
        Failure(exception: final exception) => NewsLoadFailure(
            message: ExceptionMesage(exception).message,
          ),
      },
    );
  }
}




