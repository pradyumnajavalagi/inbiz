
import '../../model/news_article_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<NewsArticle> news;

  HomeLoaded({required this.news});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
