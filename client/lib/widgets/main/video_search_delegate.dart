import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/service.dart';
import 'package:pr12er/view_models/view_model_videos.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:provider/provider.dart';

class VideoSearchDelegate extends SearchDelegate {
  List<Video> dataRef = [];
  bool showOnlyBookmarkItems = false;

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

  Widget getSearchResult(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: context.read<GrpcClient>().getVideos(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        dataRef = snapshot.requireData;

        if (showOnlyBookmarkItems) {
          return FutureBuilder<Set<int>>(
            future: context.read<FavoriteVideoViewModel>().favoriteVideosMap,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final map = snapshot.requireData;
              dataRef = dataRef
                  .where((element) => map.contains(element.prId))
                  .toList(growable: false);

              final List<Video> videos = getInterestedVideos();

              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: videos.length,
                  itemBuilder: (BuildContext context, int index) => PR12Video(
                      prID: index,
                      video: videos[index],
                      hideBookmarkIcon: showOnlyBookmarkItems));
            },
          );
        }

        final List<Video> videos = getInterestedVideos();

        return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: videos.length,
            itemBuilder: (BuildContext context, int index) => PR12Video(
                prID: index,
                video: videos[index],
                hideBookmarkIcon: showOnlyBookmarkItems));
      },
    );
  }

  List<Video> getInterestedVideos() {
    var videos = dataRef.where((video) {
      final searchLower = query.toLowerCase();
      final titleLower = video.title.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    return videos;
  }

  @override
  Widget buildResults(BuildContext context) {
    return getSearchResult(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return getSearchResult(context);
  }
}
