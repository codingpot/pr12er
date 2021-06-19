import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/screens/detail_screen.dart';

class PR12Video extends StatelessWidget {
  final int index;
  final Video video;

  const PR12Video({Key? key, required this.index, required this.video})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      key: ValueKey("ListTile-$index"),
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
            style: const TextStyle(fontStyle: FontStyle.italic),
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
      trailing: Icon(
        Icons.bookmark,
        size: 23,
        color: Theme.of(context).accentColor,
      ),
    ));
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
