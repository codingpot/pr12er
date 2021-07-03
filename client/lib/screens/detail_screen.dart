import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/service.dart';
import 'package:pr12er/utils/share_service.dart';
import 'package:pr12er/widgets/detail/abstract.dart';
import 'package:pr12er/widgets/detail/header.dart';
import 'package:pr12er/utils/extractor.dart';
import 'package:pr12er/widgets/detail/recommendation.dart';
import 'package:pr12er/widgets/detail/repository.dart';
import 'package:pr12er/widgets/detail/youtube.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreenArguments {
  final Video video;

  DetailScreenArguments(this.video);
}

class DetailScreen extends StatelessWidget {
  static const String routeName = "detail_app";
  late final Detail? detail;

  @override
  Widget build(BuildContext context) {
    final args =
        // ignore: cast_nullable_to_non_nullable
        ModalRoute.of(context)!.settings.arguments as DetailScreenArguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(args.video.title,
            key: const ValueKey("$routeName/appBar/title")),
      ),
      body: Column(
        children: [
          Flexible(
              flex: 3,
              child:
                  YoutubeWidget(youtubeId: extractYoutubeId(args.video.link))),
          Flexible(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10).copyWith(bottom: 0),
              child: ListView(
                children: [
                  HeaderWidget(video: args.video),
                  const SizedBox(height: 15),
                  FutureBuilder<Detail>(
                    future:
                        context.read<GrpcClient>().getDetail(args.video.prId),
                    builder: (context, AsyncSnapshot<Detail> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      detail = snapshot.data;

                      final papers = detail?.papers ?? [];
                      final relevantPapers = detail?.relevantPapers ?? [];
                      final sameAuthorPapers = detail?.sameAuthorPapers ?? [];

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            PaperAbstractWidget(paper: papers.first),
                            const SizedBox(height: 15),

                            // Shows Recommendation only when there's one.
                            if (papers.length +
                                    relevantPapers.length +
                                    sameAuthorPapers.length >=
                                1)
                              RecommendationWidget(detail: detail!),
                            const SizedBox(height: 15),

                            if (papers.isNotEmpty)
                              RepositoryWidget(
                                repositories: papers.first.repositories,
                              )
                          ]);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final String subject = "[PR-12 공유] ${args.video.title}";
          Share.share("$subject\n\n${generateShareSummary(args.video, detail)}",
              subject: subject);
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
