import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/widgets/components/expandable_text.dart';

// ignore: must_be_immutable
class PaperAbstractWidget extends StatelessWidget {
  late Paper paper;

  PaperAbstractWidget({Key? key, required this.paper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Abstract",
              style: Theme.of(context).textTheme.headline1,
            ),
            ExpandableText(text: paper.abstract)
          ],
        ));
  }
}
