import 'package:facebookclone/View/news/bloc/news_event.dart';
import 'package:facebookclone/View/news/bloc/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Api/api.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Api _api;
  NewsBloc(this._api) : super(NewsInitialState()) {
    on<NewsFetchEvent>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          final data = await _api.fetchNews();
          emit(
            NewsLoadedState(data),
          );
        } catch (e) {
          emit(
            NewsErrorState(e.toString()),
          );
        }
      },
    );
  }
}
