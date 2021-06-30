import 'package:flutter/material.dart';
import 'package:pr12er/view_models/view_model_videos.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';

import '../../protos/pkg/pr12er/messages.pb.dart';

class MainScreenFavoriteView extends StatelessWidget {
  const MainScreenFavoriteView({
    Key? key,
    required this.cleanList,
    required this.videoSearchDelegate,
  }) : super(key: key);

  final List<Video> cleanList;
  final VideoSearchDelegate videoSearchDelegate;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<int>>(
      future: context.read<FavoriteVideoViewModel>().favoriteVideosMap,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final Set<int> favoriteVideoMap = snapshot.data!;
        return PRVideos(
          cleanList: cleanList
              .where((element) => favoriteVideoMap.contains(element.prId))
              .toList(growable: false),
          videoSearchDelegate: videoSearchDelegate,
          hideBookmarkIcon: true,
        );
      },
    );
  }
}