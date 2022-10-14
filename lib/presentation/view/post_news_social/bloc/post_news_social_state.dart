part of 'post_news_social_cubit.dart';

@immutable
abstract class PostNewsSocialState {}

class PostNewsSocialInitial extends PostNewsSocialState {}

class PostNewsSocialLoading extends PostNewsSocialState {}

class PostNewsSocialSuccess extends PostNewsSocialState {
  final data;

  PostNewsSocialSuccess(this.data);
}

class PostNewsSocialFailure extends PostNewsSocialState {
  final message;

  PostNewsSocialFailure(this.message);
}
