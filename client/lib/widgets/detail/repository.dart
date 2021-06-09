import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

class RepositoryWidget extends StatelessWidget {
  late List<Repository> repositories;

  RepositoryWidget({Key? key, required this.repositories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Repository> visibleRepositories = getSubsetRepositories(4);

    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Repositories",
              style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 25),
            )),
        Container(
            height: 150,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6.5 / 2,
                ),
                itemCount: visibleRepositories.length,
                itemBuilder: (BuildContext context, int index) =>
                    getItemCard(visibleRepositories[index])))
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

  Widget getItemCard(Repository repository) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        backgroundImage: getImageFramework(repository.framework),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        repository.owner,
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
    ));
  }

  List<Repository> getSubsetRepositories(int size) {
    return repositories.sublist(0, size);
  }
}
