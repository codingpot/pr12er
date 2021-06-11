import 'package:flutter/widgets.dart';

class YoutubeWidget extends StatefulWidget {
  final String youtubeId;

  const YoutubeWidget({Key? key, required this.youtubeId}) : super(key: key);

  @override
  _YouTubeWidgetState createState() => _YouTubeWidgetState();
}

class _YouTubeWidgetState extends State<YoutubeWidget> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError("you have to import youtube.dart instead");
  }
}
