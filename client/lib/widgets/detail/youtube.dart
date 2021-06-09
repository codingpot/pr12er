import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeWidget extends StatefulWidget {
  final String youtubeId;

  const YoutubeWidget({Key? key, required this.youtubeId}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<YoutubeWidget> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(initialVideoId: widget.youtubeId);
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
