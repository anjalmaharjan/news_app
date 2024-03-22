import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {}

class NewsFetchEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
