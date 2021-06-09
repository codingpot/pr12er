import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

// ignore: must_be_immutable
class RecommentationWidget extends StatelessWidget {
  late Detail detail;

  RecommentationWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Paper> refPapers = getReferencePapers(detail);

    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Recommendations",
              style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 25),
            )),
        // ignore: sized_box_for_whitespace
        Container(
            height: 150,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: refPapers.length,
                itemBuilder: (BuildContext context, int index) =>
                    getItemCard(refPapers[index])))
      ]),
    );
  }

  Widget getItemCard(Paper paper) {
    return Card(
        child: ListTile(
            title: Text(paper.title),
            subtitle: Text(
                "${paper.authors[0]}  |  ${DateFormat.yMd().format(paper.pubDate.toDateTime())}")));
  }

  List<Paper> getReferencePapers(Detail detail) {
    final List<Paper> papers = <Paper>[];

    if (detail.sameAuthorPapers.isNotEmpty) {
      papers.add(detail.sameAuthorPapers[0]);
    }

    if (detail.relevantPapers.isNotEmpty) {
      papers.add(detail.relevantPapers[0]);
    }

    return papers;
  }
}