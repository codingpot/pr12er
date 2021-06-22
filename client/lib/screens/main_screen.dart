import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/widgets/main/pr12video.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';

import '../protos/pkg/pr12er/messages.pb.dart';
import '../service.dart';

const appName = 'PR12er';

enum VertMenu { themeMode, issueReport }

class MainScreen extends StatelessWidget {
  static const String routeName = "main_screen";
  final VideoSearchDelegate videoSearchDelegate = VideoSearchDelegate();

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
                      // 투명 아이콘을 설정해서 다크모드 와 텍스트 Alignment 유지
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
      body: PRVideos(videoSearchDelegate: videoSearchDelegate),
    );
  }
}

// ignore: must_be_immutable
class PRVideos extends StatelessWidget {
  late VideoSearchDelegate videoSearchDelegate;

  PRVideos({Key? key, required this.videoSearchDelegate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: context.read<GrpcClient>().getVideos(),
        builder: (context, AsyncSnapshot<List<Video>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          videoSearchDelegate.dataRef = snapshot.data!;

          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) =>
                  PR12Video(index: index, video: snapshot.data![index]));
        });
  }
}
