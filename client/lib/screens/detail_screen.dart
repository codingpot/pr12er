import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/service.dart';
import 'package:pr12er/widgets/detail/abstract.dart';
import 'package:pr12er/widgets/detail/header.dart';
import 'package:pr12er/utils/extractor.dart';
import 'package:pr12er/widgets/detail/recommendataion.dart';
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
          LimitedBox(
            maxHeight: 350,
            child: YoutubeWidget(youtubeId: extractYoutubeId(args.video.link)),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Column(
                      children: [
                        FittedBox(child: HeaderWidget(video: args.video)),
                        const SizedBox(height: 15),
                        FutureBuilder<Detail>(
                          future: context
                              .read<GrpcClient>()
                              .getDetails(args.video.prId),
                          builder: (context, AsyncSnapshot<Detail> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            detail = snapshot.data;

                            return Column(children: [
                              PaperAbstractWidget(
                                  paper: snapshot.data!.paper[0]),
                              const SizedBox(height: 15),
                              RecommentationWidget(detail: snapshot.data!),
                              const SizedBox(height: 15),
                              RepositoryWidget(
                                repositories:
                                    snapshot.data!.paper[0].repositories,
                              )
                            ]);
                          },
                        )
                      ],
                    ),
                  )
                ]))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final String subject = "[논문공유] ${args.video.title}";
          final StringBuffer message = StringBuffer();

          message.writeln('YouTube Link');
          message.writeln('\t- ${args.video.link}');

          if (detail != null) {
            message.writeln('\nPaper');
            message.writeln('\t- title: ${detail!.paper[0].title}');
            message.writeln('\t- link: https://arxiv.org/abs/${detail!.paper[0].arxivId}');

            message.writeln('abstract');
            message.writeln('\t- ${detail!.paper[0].abstract}');

            message.writeln('repositories');
            for (final repo in detail!.paper[0].repositories) {
              message.writeln('\t- ${repo.owner}: ${repo.url}');
            }

            message.writeln('\nRecommended Papers');
            for (final paper in detail!.relevantPapers) {
              message.writeln('\t- ${paper.title}(${paper.authors[0]}): https://arxiv.org/abs/${paper.arxivId}');
            }
            for (final paper in detail!.sameAuthorPapers) {
              message.writeln('\t- ${paper.title}(${paper.authors[0]}): https://arxiv.org/abs/${paper.arxivId}');
            }
          }

          log(message.toString());

          Share.share(message.toString(), subject: subject);
        },
        child: const Icon(Icons.email),
      ),
    );
  }
}
