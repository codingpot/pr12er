import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/view_models/view_model_videos.dart';
import 'package:pr12er/widgets/components/custom_app_bar.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';

import '../protos/pkg/pr12er/messages.pb.dart';
import '../service.dart';

const appName = 'PR12er';

class MainScreen extends StatefulWidget {
  static const String routeName = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Video> cleanList;
  VideoSearchDelegate videoSearchDelegate = VideoSearchDelegate();
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: context.read<GrpcClient>().getVideos(),
        builder: (context, AsyncSnapshot<List<Video>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final cleanList = snapshot.data!
              .where((video) => video.hasTitle() && video.hasLink())
              .toList();

          return Scaffold(
            appBar: CustomAppBar(
              videoSearchDelegate: videoSearchDelegate,
              context: context,
              title: appName,
            ),
            body: IndexedStack(
              index: _selectedBottomNavIndex,
              children: [
                PRVideos(
                  cleanList: cleanList,
                  videoSearchDelegate: videoSearchDelegate,
                  hideBookmarkIcon: false,
                ),
                FutureBuilder<Set<int>>(
                  future:
                      context.read<FavoriteVideoViewModel>().favoriteVideosMap,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final Set<int> favoriteVideoMap = snapshot.data!;
                    return PRVideos(
                      cleanList: cleanList
                          .where((element) =>
                              favoriteVideoMap.contains(element.prId))
                          .toList(growable: false),
                      videoSearchDelegate: videoSearchDelegate,
                      hideBookmarkIcon: true,
                    );
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: '전체',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.bookmark_added,
                    ),
                    label: '북마크',
                  ),
                ],
                currentIndex: _selectedBottomNavIndex,
                onTap: (int index) {
                  setState(() {
                    _selectedBottomNavIndex = index;
                    videoSearchDelegate.ignoreBookmarkIcon = index == 1;
                  });
                }),
          );
        });
  }
}
