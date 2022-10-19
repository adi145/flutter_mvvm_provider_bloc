part of 'posts_bloc.dart';

@immutable
abstract class PostsState {
  List<Posts> posts = [];
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsLoadedState extends PostsState {
  List<Posts> posts;

  PostsLoadedState({required this.posts});
}

class PostsFailedState extends PostsState {
  String error;

  PostsFailedState({required this.error});
}
