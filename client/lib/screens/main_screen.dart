import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pr12er/widgets/pr12video.dart';
import 'package:provider/provider.dart';

import '../protos/pkg/pr12er/messages.pb.dart';
import '../service.dart';

const appName = 'PR12er';

class MainScreen extends StatelessWidget {
  static const String routeName = "main_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // do something
              },
            )
          ],
          title: const Text(appName),
        ),
        body: PRVideos());
  }
}

class PRVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
        future: context.read<GrpcClient>().getVideos(),
        builder: (context, AsyncSnapshot<List<Video>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) =>
                  PR12Video(index: index, video: snapshot.data![index]));
        });
  }
}
