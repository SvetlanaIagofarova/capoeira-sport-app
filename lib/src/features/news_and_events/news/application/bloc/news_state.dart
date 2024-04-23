part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoadInProgress extends NewsState {}

final class NewsLoadSuccess extends NewsState {
  final List<News> newsList;

  const NewsLoadSuccess({required this.newsList});

  @override
  List<Object> get props => [newsList];
}

final class NewsLoadFailure extends NewsState {
  final String message;

  const NewsLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
