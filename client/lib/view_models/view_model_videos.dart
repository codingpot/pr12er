import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kFavoriteVideo = "favorite_videos";

/// FavoriteVideoViewModel is the single source of truth for Favorite Videos.
class FavoriteVideoViewModel extends ChangeNotifier {
  Set<int> _favoriteVideos = {};
  bool initialized = false;

  FavoriteVideoViewModel();

  Future<void> addFavoriteVideo(int prID) async {
    if (!initialized) await _initialize();

    _favoriteVideos.add(prID);
    await _storeCurrentState();
    notifyListeners();
  }

  Future<void> removeFavoriteVideo(int prID) async {
    if (!initialized) await _initialize();

    _favoriteVideos.remove(prID);
    await _storeCurrentState();
    notifyListeners();
  }

  Future<bool> isFavoriteVideo(int prID) async {
    if (!initialized) await _initialize();

    return _favoriteVideos.contains(prID);
  }

  Future<Set<int>> get favoriteVideosMap async {
    if (!initialized) await _initialize();
    return _favoriteVideos;
  }

  Future<void> _storeCurrentState() async {
    final instance = await SharedPreferences.getInstance();
    instance.setStringList(
        _kFavoriteVideo, _favoriteVideos.map((e) => e.toString()).toList());
  }

  Future<void> _initialize() async {
    initialized = true;
    final instance = await SharedPreferences.getInstance();

    _favoriteVideos = instance
            .getStringList(_kFavoriteVideo)
            ?.map((e) => int.parse(e, radix: 10))
            .toSet() ??
        {};
  }

  Future<void> toggleFavoriteVideo(int prID) async {
    if (await isFavoriteVideo(prID)) {
      await removeFavoriteVideo(prID);
    } else {
      await addFavoriteVideo(prID);
    }
  }
}
