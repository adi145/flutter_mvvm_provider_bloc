import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/Albums/albums_model.dart';
import 'package:mvvm_provider/Albums/albums_service.dart';

class AlbumsViewModel extends ChangeNotifier {
  List<Album> album = [];

  Future<void> callFetchAlbum() async {
    try {
      album = await AlbumsService().fetchAlbum();
      notifyListeners();
    } catch (e) {
      log('error $e');
    }
  }
}
