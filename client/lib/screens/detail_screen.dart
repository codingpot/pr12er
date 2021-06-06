import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:pr12er/utils/extractor.dart';

class DetailScreenArguments {
  final Video video;

  DetailScreenArguments(this.video);
}

class DetailScreen extends StatelessWidget {
  static const String routeName = "detail_app";

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
        body: Detail(youtubeId: extractYoutubeId(args.video.link)));
  }
}

class Detail extends StatefulWidget {
  final String youtubeId;

  const Detail({required this.youtubeId});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Column(
          children: [player],
        );
      },
    );
  }
}
