import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeWidget extends StatefulWidget {
  final String youtubeId;

  const YoutubeWidget({
    Key? key,
    required this.youtubeId,
  }) : super(key: key);

  @override
  _YouTubeWidgetState createState() => _YouTubeWidgetState();
}

class _YouTubeWidgetState extends State<YoutubeWidget> {
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
    // YoutubePlayerBuilder is needed for full screen support.
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) => Expanded(child: player));
  }
}
