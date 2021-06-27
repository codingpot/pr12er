import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/utils/extractor.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryWidget extends StatelessWidget {
  final List<Repository> repositories;

  const RepositoryWidget({Key? key, required this.repositories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Repository> visibleRepositories = getSubsetRepositories(4);

    return Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Repositories",
                style: Theme.of(context).textTheme.headline1,
              )),
          ...visibleRepositories.map((repo) => getItemCard(context, repo))
        ]));
  }

  AssetImage getImageFramework(Framework framework) {
    switch (framework) {
      case Framework.FRAMEWORK_TENSORFLOW:
        return const AssetImage('images/tf-logo.png');
      case Framework.FRAMEWORK_PYTORCH:
        return const AssetImage('images/pytorch-logo.png');
      default:
        // placeholder. when found appropriate image for OTHERS and UNDEFINED, this line will be replaced
        return const AssetImage('images/pytorch-logo.png');
    }
  }

  Widget getItemCard(BuildContext context, Repository repo) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(repo.url)) {
          await launch(repo.url);
          return;
        }
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: Text("${repo.url} is not a valid URL"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
            textColor: Theme.of(context).colorScheme.onError,
          ),
        ));
      },
      child: Card(
          child: ListTile(
        leading: CircleAvatar(
          backgroundImage: getImageFramework(repo.framework),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          extractRepoNameFromURL(repo.url),
        ),
        subtitle: Text(
          repo.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      )),
    );
  }

  List<Repository> getSubsetRepositories(int maxSize) {
    return repositories.sublist(0, min(maxSize, repositories.length));
  }
}
