import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/utils/extractor.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class RepositoryWidget extends StatelessWidget {
  late List<Repository> repositories;

  RepositoryWidget({Key? key, required this.repositories}) : super(key: key);

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
        // ignore: sized_box_for_whitespace
        Container(
            height: 150,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6.5 / 2,
                ),
                itemCount: visibleRepositories.length,
                itemBuilder: (BuildContext context, int index) =>
                    getItemCard(context, visibleRepositories[index])))
      ]),
    );
  }

  AssetImage getImageFramework(Framework framework) {
    switch (framework) {
      case Framework.FRAMEWORK_TENSORFLOW:
        return const AssetImage('images/tf-logo.png');
      case Framework.FRAMEWORK_PYTORCH:
        return const AssetImage('images/pytorch-logo.png');
      default:
        // placeholder. when found appropriage image for OTHERS and UNDEFINED, this line will be replaced
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
      )),
    );
  }

  List<Repository> getSubsetRepositories(int size) {
    return repositories.sublist(0, size);
  }
}
