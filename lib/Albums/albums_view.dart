import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/Albums/albums_viewmodel.dart';
import 'package:provider/provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AlbumsViewModel>().callFetchAlbum());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<AlbumsViewModel>(builder: (context, posts, child) {
          return posts.album.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemCount: posts.album.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('${posts.album[index].title}'));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: 1, color: Colors.grey);
                  },
                );
        }));
  }
}
