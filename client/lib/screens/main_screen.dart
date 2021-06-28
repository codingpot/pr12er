import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/screens/main_screen_all.dart';
import 'package:pr12er/screens/main_screen_bookmark.dart';
import 'package:provider/provider.dart';

import '../protos/pkg/pr12er/messages.pb.dart';
import '../service.dart';

const appName = 'PR12er';

enum VertMenu { themeMode, issueReport }

class MainScreen extends StatefulWidget {
  static const String routeName = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Video> cleanList;

  int _selectedBtmNavIndex = 0;

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
            body: IndexedStack(
              index: _selectedBtmNavIndex,
              children: [
                MainScreenAll(cleanList: cleanList),
                MainScreenBookmark(cleanList: cleanList),
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
                currentIndex: _selectedBtmNavIndex,
                selectedItemColor: Colors.amber[800],
                onTap: (int index) {
                  setState(() {
                    _selectedBtmNavIndex = index;
                  });
                }),
          );
        });
  }
}
