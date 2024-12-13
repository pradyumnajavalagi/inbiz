import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/news_article_model.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../../services/news_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeFetch>(_onFetch);
  }

  Future<void> _onFetch(HomeFetch event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final rawData = await NewsService().fetchNews(event.category);
      final news = rawData.map<NewsArticle>((e) => NewsArticle.fromMap(e)).toList();
      emit(HomeLoaded(news: news));
    } catch (error) {
      emit(HomeError(message: error.toString()));
    }
  }
}
