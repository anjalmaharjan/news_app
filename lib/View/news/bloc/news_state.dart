import 'package:equatable/equatable.dart';
import 'package:facebookclone/Models/news/news_model.dart';

abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final NewsModel newsModel;
  NewsLoadedState(this.newsModel);
  @override
  List<Object?> get props => [newsModel];
}

class NewsErrorState extends NewsState {
  final String errorMsg;
  NewsErrorState(this.errorMsg);
  @override
  List<Object?> get props => [errorMsg];
}
