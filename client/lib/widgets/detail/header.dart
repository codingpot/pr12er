import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

class HeaderWidget extends StatelessWidget {
  final Video video;

  const HeaderWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...getPresenterWidgets(context),
          const SizedBox(width: 25),
          ...getViewNumbersWidgets(),
          const SizedBox(width: 25),
          ...getDateWidgets(),
        ],
      ),
    );
  }

  Widget getLikeIcon() {
    return const Icon(Icons.thumb_up_alt_outlined);
  }

  List<Widget> getViewNumbersWidgets() {
    return [
      const SizedBox(width: 8),
      const Icon(Icons.remove_red_eye),
      const SizedBox(width: 8),
      Text(NumberFormat.compact().format(video.numberOfViews),
          style: const TextStyle(fontSize: 18)),
      const SizedBox(width: 15),
      getLikeIcon(),
      const SizedBox(width: 8),
      Text(NumberFormat.compact().format(video.numberOfLike),
          style: const TextStyle(fontSize: 18)),
    ];
  }

  List<Widget> getPresenterWidgets(BuildContext context) {
    return [
      Text(video.presenter, style: Theme.of(context).textTheme.subtitle1)
    ];
  }

  List<Widget> getDateWidgets() {
    return [
      const Icon(Icons.today),
      const SizedBox(width: 8),
      Text(DateFormat.yMd().format(video.publishedDate.toDateTime()),
          style: const TextStyle(fontSize: 18))
    ];
  }
}
