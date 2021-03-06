import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/widgets/components/open_url_on_tap.dart';

class RecommendationWidget extends StatelessWidget {
  final Detail detail;

  const RecommendationWidget({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Paper> refPapers = getReferencePapers(detail);

    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Recommendations",
              style: Theme.of(context).textTheme.headline1,
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: refPapers.length,
            itemBuilder: (BuildContext context, int index) =>
                _Paper(paper: refPapers[index]))
      ]),
    );
  }

  List<Paper> getReferencePapers(Detail detail) {
    final List<Paper> papers = detail.papers;

    if (detail.sameAuthorPapers.isNotEmpty) {
      papers.add(detail.sameAuthorPapers[0]);
    }

    if (detail.relevantPapers.isNotEmpty) {
      papers.add(detail.relevantPapers[0]);
    }

    return papers;
  }
}

class _Paper extends StatelessWidget {
  final Paper paper;

  const _Paper({
    Key? key,
    required this.paper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenURLOnTap(
        url: "https://arxiv.org/abs/${paper.arxivId}",
        child: Card(
            child: ListTile(
                title: Text(paper.title),
                subtitle: Text(
                    "${paper.authors[0]}  |  ${DateFormat.yMd().format(paper.publishedDate.toDateTime())}"))));
  }
}
