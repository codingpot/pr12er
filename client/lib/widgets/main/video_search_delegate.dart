import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/widgets/main/pr12video.dart';

class VideoSearchDelegate extends SearchDelegate {
  late List<Video> dataRef;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  Widget getSearchResult() {
    final videos = dataRef.where((video) {
      final searchLower = query.toLowerCase();
      final titleLower = video.title.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: videos.length,
        itemBuilder: (BuildContext context, int index) =>
            PR12Video(index: index, video: videos[index]));
  }

  @override
  Widget buildResults(BuildContext context) {
    return getSearchResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return getSearchResult();
  }
}
