import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/screens/detail_screen.dart';
import 'package:pr12er/view_models/view_model_videos.dart';

class PRVideos extends StatelessWidget {
  final List<Video> cleanList;
  final bool hideBookmarkIcon;

  const PRVideos(
      {Key? key, required this.cleanList, required this.hideBookmarkIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cleanList.length,
        itemBuilder: (BuildContext context, int index) => PR12Video(
            prID: cleanList[index].prId,
            video: cleanList[index],
            hideBookmarkIcon: hideBookmarkIcon));
  }
}

class PR12Video extends StatelessWidget {
  final int prID;
  final Video video;
  final bool hideBookmarkIcon;

  const PR12Video(
      {Key? key,
      required this.prID,
      required this.video,
      required this.hideBookmarkIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            key: ValueKey("ListTile-$prID"),
            leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getCategoryWidgets(video.category)),
            title: Text(
              video.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            contentPadding: const EdgeInsets.all(20),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.presenter,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  getKeywords(video.keywords),
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
                arguments: DetailScreenArguments(video),
              );
            },
            trailing: getTrailingWidget(context, video.prId)));
  }

  Widget? getTrailingWidget(BuildContext context, int prID) {
    if (hideBookmarkIcon) {
      return null;
    }

    return FutureBuilder<bool>(
      future: context.select<FavoriteVideoViewModel, Future<bool>>(
          (service) => service.isFavoriteVideo(prID)),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        final bool isFavorite = snapshot.data!;

        return IconButton(
          onPressed: () =>
              context.read<FavoriteVideoViewModel>().toggleFavoriteVideo(prID),
          icon: Icon(
            isFavorite
                ? Icons.bookmark_add_rounded
                : Icons.bookmark_add_outlined,
            size: 30,
            color: Theme.of(context).accentColor,
          ),
        );
      },
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
