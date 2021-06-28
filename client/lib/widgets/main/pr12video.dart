import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/screens/detail_screen.dart';
import 'package:pr12er/widgets/main/video_search_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PRVideos extends StatelessWidget {
  final VideoSearchDelegate videoSearchDelegate;
  final List<Video> cleanList;
  final bool ignoreBookmarkIcon;

  const PRVideos(
      {Key? key,
      required this.cleanList,
      required this.videoSearchDelegate,
      required this.ignoreBookmarkIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    videoSearchDelegate.dataRef = cleanList;

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cleanList.length,
        itemBuilder: (BuildContext context, int index) => PR12Video(
            index: index,
            video: cleanList[index],
            ignoreBookmarkIcon: ignoreBookmarkIcon));
  }
}

class PR12Video extends StatefulWidget {
  final int index;
  final Video video;
  final bool ignoreBookmarkIcon;

  const PR12Video(
      {Key? key,
      required this.index,
      required this.video,
      required this.ignoreBookmarkIcon})
      : super(key: key);

  @override
  _PR12VideoState createState() => _PR12VideoState();
}

class _PR12VideoState extends State<PR12Video> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      final List<String>? bookmarks = prefs.getStringList("bookmark");
      if (bookmarks != null && bookmarks.contains(widget.index.toString())) {
        setState(() {
          isBookmarked = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            key: ValueKey("ListTile-${widget.index}"),
            leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getCategoryWidgets(widget.video.category)),
            title: Text(
              widget.video.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            contentPadding: const EdgeInsets.all(20),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.video.presenter,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  getKeywords(widget.video.keywords),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.apply(fontStyle: FontStyle.italic),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailScreen.routeName,
                arguments: DetailScreenArguments(widget.video),
              );
            },
            trailing: getTrailingWidget()));
  }

  Widget? getTrailingWidget() {
    if (widget.ignoreBookmarkIcon) {
      return null;
    }

    return IconButton(
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        List<String>? bookmarks = prefs.getStringList("bookmark");
        if (bookmarks != null) {
          if (bookmarks.contains(widget.index.toString())) {
            bookmarks.remove(widget.index.toString());
          } else {
            bookmarks.add(widget.index.toString());
          }
          prefs.setStringList("bookmark", bookmarks);
        } else {
          bookmarks = [widget.index.toString()];
          prefs.setStringList("bookmark", bookmarks);
        }

        log(bookmarks.toString());

        setState(() {
          isBookmarked = !isBookmarked;
        });
      },
      icon: Icon(
        isBookmarked ? Icons.bookmark_add_rounded : Icons.bookmark_add_outlined,
        size: 30,
        color: Theme.of(context).accentColor,
      ),
    );
  }
}

String getKeywords(List<String> keywords) {
  return keywords.join(", ");
}

List<Widget> getCategoryWidgets(Category category) {
  switch (category) {
    case Category.CATEGORY_VISION:
      return [const Icon(Icons.remove_red_eye), const Text('CV')];
    case Category.CATEGORY_NLP:
      return [const Icon(Icons.translate), const Text('NLP')];
    case Category.CATEGORY_AUDIO:
      return [const Icon(Icons.graphic_eq), const Text('AUDIO')];
    case Category.CATEGORY_RS:
      return [const Icon(Icons.assistant), const Text('RS')];
    case Category.CATEGORY_OCR:
      return [const Icon(Icons.text_fields), const Text('OCR')];
    case Category.CATEGORY_UNSPECIFIED:
    default:
      return [const Icon(Icons.grid_view), const Text('ETC')];
  }
}
