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

class DetailScreenArguments {
  final Video video;

  DetailScreenArguments(this.video);
}

class DetailScreen extends StatelessWidget {
  static const String routeName = "detail_app";

  Widget getHorizontalLine() {
    return const Divider(
      height: 5,
      color: Colors.black,
      indent: 5,
      endIndent: 5,
    );
  }

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
          YoutubeWidget(youtubeId: extractYoutubeId(args.video.link)),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Column(
                      children: [
                        HeaderWidget(video: args.video),
                        const SizedBox(height: 10),
                        getHorizontalLine(),
                        const SizedBox(height: 10),
                        FutureBuilder<Detail>(
                          future: context
                              .read<GrpcClient>()
                              .getDetails(args.video.id),
                          builder: (context, AsyncSnapshot<Detail> snapshot) {
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            return Column(children: [
                              PaperAbstractWidget(
                                  paper: snapshot.data!.paper[0]),
                              const SizedBox(height: 10),
                              getHorizontalLine(),
                              const SizedBox(height: 10),
                              RecommentationWidget(detail: snapshot.data!),
                              const SizedBox(height: 10),
                              getHorizontalLine(),
                              const SizedBox(height: 10),
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
          // Add your onPressed code here!
        },
        child: const Icon(Icons.email),
      ),
    );
  }
}
