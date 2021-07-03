import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

class HeaderWidget extends StatelessWidget {
  final Video video;

  const HeaderWidget({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return _HeaderInternal(video: video);
    }
    return FittedBox(
      child: _HeaderInternal(video: video),
    );
  }
}

class _HeaderInternal extends StatelessWidget {
  const _HeaderInternal({
    Key? key,
    required this.video,
  }) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(video.presenter, style: Theme.of(context).textTheme.subtitle1),

        const SizedBox(width: 25),

        // Views and likes icons
        _ViewsAndLikes(
          numberOfViews: video.numberOfViews,
          numberOfLike: video.numberOfLike,
        ),

        const SizedBox(width: 25),

        // Date Widgets
        _Dates(date: video.publishedDate.toDateTime()),
      ],
    );
  }
}

class _Dates extends StatelessWidget {
  final DateTime date;

  const _Dates({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.today),
        const SizedBox(width: 8),
        Text(DateFormat.yMd().format(date),
            style: const TextStyle(fontSize: 18))
      ],
    );
  }
}

class _ViewsAndLikes extends StatelessWidget {
  final Int64 numberOfViews;
  final Int64 numberOfLike;

  const _ViewsAndLikes({
    Key? key,
    required this.numberOfViews,
    required this.numberOfLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 8),
      const Icon(Icons.remove_red_eye),
      const SizedBox(width: 8),
      Text(NumberFormat.compact().format(numberOfViews),
          style: const TextStyle(fontSize: 18)),
      const SizedBox(width: 15),
      const Icon(Icons.thumb_up_alt_outlined),
      const SizedBox(width: 8),
      Text(NumberFormat.compact().format(numberOfLike),
          style: const TextStyle(fontSize: 18))
    ]);
  }
}
