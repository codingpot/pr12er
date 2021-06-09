import 'package:flutter/material.dart';

class RepositoryWidget extends StatelessWidget {
  const RepositoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 6.5 / 2,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) =>
                    getItemCard(index)))
      ]),
    );
  }

  Widget getItemCard(index) {
    if (index == 0) {
      return const Card(
          child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/tf-logo.png'),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          'goodfeli',
          overflow: TextOverflow.clip,
        ),
      ));
    } else {
      return const Card(
          child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/pytorch-logo.png'),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          'eriklindernoren',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
  }
}
