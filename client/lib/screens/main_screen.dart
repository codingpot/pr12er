import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../protos/pkg/pr12er/messages.pb.dart';
import '../service.dart';
import '../sort_preference.dart';
import '../widgets/components/custom_app_bar.dart';
import '../widgets/components/custom_bottom_navigation_bar.dart';
import '../widgets/main/main_screen_favorite_view.dart';
import '../widgets/main/main_screen_list_view.dart';
import '../widgets/main/video_search_delegate.dart';

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

          return Consumer<SortMode>(
              builder: (context, sort, _child) => Scaffold(
                  appBar: CustomAppBar(
                    videoSearchDelegate: videoSearchDelegate,
                    context: context,
                    title: appName,
                  ),
                  body: IndexedStack(
                    index: _selectedBottomNavIndex,
                    children: [
                      MainScreenListView(
                          cleanList: sort.isDescOrder
                              ? List.from(cleanList.reversed)
                              : cleanList),
                      MainScreenFavoriteView(
                          cleanList: sort.isDescOrder
                              ? List.from(cleanList.reversed)
                              : cleanList)
                    ],
                  ),
                  bottomNavigationBar: CustomBottomNavigationBar(
                      selectedBottomNavIndex: _selectedBottomNavIndex,
                      onTap: (index) => setState(() {
                            _selectedBottomNavIndex = index;
                            videoSearchDelegate.showOnlyBookmarkItems =
                                index == 1;
                          }))));
        });
  }
}
