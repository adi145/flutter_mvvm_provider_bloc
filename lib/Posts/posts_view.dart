import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_provider/Posts/posts_bloc.dart';
import 'package:mvvm_provider/Posts/posts_model.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsLoadedState) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<PostsBloc>().add(PullToRefreshPosts()),
            child: ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                Posts post = state.posts[index];
                return ListTile(
                    title: Text(
                      '${post.title}',
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      '${post.body}',
                      maxLines: 2,
                    ));
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 1, color: Colors.grey);
              },
            ),
          );
        } else if (state is PostsFailedState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
