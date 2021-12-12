import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeWidget extends StatefulWidget {
  final String youtubeId;

  const YoutubeWidget({Key? key, required this.youtubeId}) : super(key: key);

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
        params: const YoutubePlayerParams(showFullscreenButton: true));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      // Provides controller to all the widget below it.
      controller: _controller,
      child: const YoutubePlayerIFrame(
        // ignore: avoid_redundant_argument_values
        aspectRatio: 16 / 9,
      ),
    );
  }
}
