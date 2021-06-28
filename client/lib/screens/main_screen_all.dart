import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/report.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../protos/pkg/pr12er/messages.pb.dart';

const appName = 'PR12er';

enum VertMenu { themeMode, issueReport }

class MainScreenAll extends StatefulWidget {
  static const String routeName = "main_screen";
  final List<Video> cleanList;

  const MainScreenAll({Key? key, required this.cleanList}) : super(key: key);

  @override
  _MainScreenAllState createState() => _MainScreenAllState();
}

class _MainScreenAllState extends State<MainScreenAll> {
  final VideoSearchDelegate videoSearchDelegate = VideoSearchDelegate()
    ..ignoreBookmarkIcon = false;

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
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
        title: const Text(appName),
      ),
      body: PRVideos(
        cleanList: widget.cleanList,
        videoSearchDelegate: videoSearchDelegate,
        ignoreBookmarkIcon: false,
      ),
    );
  }
}
