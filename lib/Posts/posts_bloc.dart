import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/Posts/posts_model.dart';
import 'package:mvvm_provider/Posts/posts_service.dart';
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final postsService = PostsService();

  PostsBloc() : super(PostsLoadingState()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadPosts || event is PullToRefreshPosts) {
        // debugPrint('movieTitle: ${event.postId} ');
        emit(PostsLoadingState());
        try {
          final posts = await postsService.fetchPosts();
          emit(PostsLoadedState(posts: posts));
        } catch (e) {
          emit(PostsFailedState(error: e.toString()));
        }
      }
    });
  }
}
