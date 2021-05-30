import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailApp extends StatelessWidget {
  late String url;

  DetailApp(String url) {
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Detail View'),
          ),
          body: Detail(this.url)),
    );
  }
}

class Detail extends StatefulWidget {
  late String url;

  Detail(String url) {
    this.url = url;
  }
  @override
  _DetailState createState() => _DetailState(this.url);
}

class _DetailState extends State<Detail> {
  late String url;
  late YoutubePlayerController _controller;

  _DetailState(String url) {
    this.url = url;
  }

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: this.url,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      aspectRatio: 16 / 9,
      controller: _controller,
      showVideoProgressIndicator: false,
      progressIndicatorColor: Colors.redAccent,
      progressColors: ProgressBarColors(
        playedColor: Colors.transparent,
        handleColor: Colors.transparent,
      ),
      onEnded: (data) {
        _controller.pause();
      },
      topActions: <Widget>[
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            _controller.metadata.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
      bottomActions: <Widget>[
        const SizedBox(width: 14.0),
        CurrentPosition(),
        const SizedBox(width: 8.0),
        ProgressBar(
          isExpanded: true,
          colors: ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.red,
              backgroundColor: Colors.white,
              bufferedColor: Colors.grey),
        ),
        RemainingDuration(),
      ],
    );
  }
}
