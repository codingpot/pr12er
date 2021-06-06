import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderWidget extends StatelessWidget {
  String presenter = "박찬성";
  int numberOfViews = 0;
  int numberOfLikes = 0;
  bool didILikedIt = false;
  String date = "2017.4.22";

  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getPresenterWidgets() +
              [const SizedBox(width: 25)] +
              getViewNumbersWidgets() +
              [const SizedBox(width: 25)] +
              getDateWidgets()),
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
      Text(numberOfViews.toString(), style: const TextStyle(fontSize: 18)),
      const SizedBox(width: 15),
      getLikeIcon(),
      const SizedBox(width: 8),
      Text(numberOfLikes.toString(), style: const TextStyle(fontSize: 18)),
    ];
  }

  List<Widget> getPresenterWidgets() {
    return [
      Text(presenter,
          style: const TextStyle(
              color: Colors.black54, fontSize: 18, fontStyle: FontStyle.italic))
    ];
  }

  List<Widget> getDateWidgets() {
    return [
      const Icon(Icons.today),
      const SizedBox(width: 8),
      Text(date, style: const TextStyle(fontSize: 18))
    ];
  }
}
