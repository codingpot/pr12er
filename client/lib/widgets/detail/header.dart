import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  // this is a placeholder
  // didILIkedIt should be replaced in the next future PR
  // after defining user related information
  bool didILikedIt = false;

  late Video video;

  HeaderWidget({Key? key, required this.video}) : super(key: key);

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
    if (didILikedIt) {
      return const Icon(Icons.thumb_up_alt);
    }
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
