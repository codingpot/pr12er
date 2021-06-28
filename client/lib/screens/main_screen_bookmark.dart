import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/report.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../protos/pkg/pr12er/messages.pb.dart';

const appName = 'PR12er';

enum VertMenu { themeMode, issueReport }

class MainScreenBookmark extends StatefulWidget {
  static const String routeName = "main_screen";
  final List<Video> cleanList;

  const MainScreenBookmark({Key? key, required this.cleanList})
      : super(key: key);

  @override
  _MainScreenBookmarkState createState() => _MainScreenBookmarkState();
}

class _MainScreenBookmarkState extends State<MainScreenBookmark> {
  final VideoSearchDelegate videoSearchDelegate = VideoSearchDelegate()
    ..ignoreBookmarkIcon = true;
  List<Video> bookmarkVideos = [];

  Future<void> getBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? stringIndicies = prefs.getStringList("bookmark");

    if (stringIndicies != null) {
      final List<Video> tmpBookmarkVideos = [];

      for (final String index in stringIndicies) {
        tmpBookmarkVideos.add(widget.cleanList[int.parse(index)]);
      }

      setState(() {
        bookmarkVideos = tmpBookmarkVideos;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // do something
              showSearch(context: context, delegate: videoSearchDelegate);
            },
          ),
          const SizedBox(
            width: 5,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<VertMenu>>[
              PopupMenuItem<VertMenu>(
                  value: VertMenu.themeMode,
                  child: ListTile(
                      leading: context.read<CustomTheme>().icon,
                      title: context.read<CustomTheme>().text)),
              const PopupMenuDivider(height: 5),
              const PopupMenuItem<VertMenu>(
                  value: VertMenu.issueReport,
                  child: ListTile(
                      leading: Icon(
                        Icons.report,
                      ),
                      title: Text("이슈 리포트"))),
            ],
            onSelected: (value) {
              switch (value) {
                case VertMenu.themeMode:
                  context.read<CustomTheme>().toggleMode();
                  break;
                case VertMenu.issueReport:
                  showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => const ReportWidget());
                  break;
              }
            },
            child: const Icon(Icons.more_vert),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        title: const Text(appName),
      ),
      body: RefreshIndicator(
          onRefresh: () => getBookmarks(),
          child: PRVideos(
            cleanList: bookmarkVideos,
            videoSearchDelegate: videoSearchDelegate,
            ignoreBookmarkIcon: true,
          )),
    );
  }
}
