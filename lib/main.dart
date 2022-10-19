import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_provider/Albums/albums_view.dart';
import 'package:mvvm_provider/Albums/albums_viewmodel.dart';
import 'package:mvvm_provider/Posts/posts_view.dart';
import 'package:mvvm_provider/Posts/posts_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
//dd
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => PostsBloc()..add(LoadPosts()),
        child: const PostsView(title: 'Albums'),
      ),
      /*ChangeNotifierProvider(
        create: (context) => AlbumsViewModel(),
        child: const AlbumPage(title: 'Albums'),
      ),*/
      //const MyHomePage(title: 'Posts'),
    );
  }
}

