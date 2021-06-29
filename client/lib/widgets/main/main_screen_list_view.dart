import 'package:flutter/material.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import "../../protos/pkg/pr12er/messages.pb.dart";

class MainScreenListView extends StatelessWidget {
  const MainScreenListView({
    Key? key,
    required this.cleanList,
    required this.videoSearchDelegate,
  }) : super(key: key);

  final List<Video> cleanList;
  final VideoSearchDelegate videoSearchDelegate;

  @override
  Widget build(BuildContext context) {
    return PRVideos(
      cleanList: cleanList,
      videoSearchDelegate: videoSearchDelegate,
      hideBookmarkIcon: false,
    );
  }
}
