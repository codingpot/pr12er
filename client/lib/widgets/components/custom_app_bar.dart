import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/sort_preference.dart';
import 'package:pr12er/widgets/main/report.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:provider/provider.dart';

enum VertMenu { themeMode, sortMode, issueReport }

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required BuildContext context,
    required VideoSearchDelegate videoSearchDelegate,
    required String title,
  }) : super(
          key: key,
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
              key: const ValueKey("popup-menu-button"),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<VertMenu>>[
                PopupMenuItem<VertMenu>(
                    key: const ValueKey("icon-theme-toggle-button"),
                    value: VertMenu.themeMode,
                    child: ListTile(
                        leading: Icon(context.read<CustomTheme>().icon),
                        title: Text(context.read<CustomTheme>().text))),
                const PopupMenuDivider(height: 5),
                PopupMenuItem<VertMenu>(
                    key: const ValueKey("icon-sort-toggle-button"),
                    value: VertMenu.sortMode,
                    child: ListTile(
                        leading: Icon(context.read<SortMode>().icon),
                        title: Text(context.read<SortMode>().text))),
                const PopupMenuDivider(height: 5),
                const PopupMenuItem<VertMenu>(
                    key: ValueKey("popup-menu-item-issue-report"),
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
                  case VertMenu.sortMode:
                    context.read<SortMode>().toggleMode();
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
          title: Text(title),
        );
}
