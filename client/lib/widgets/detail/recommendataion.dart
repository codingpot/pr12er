import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

class RecommentationWidget extends StatelessWidget {
  late Detail detail;

  RecommentationWidget({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Recommendations",
              style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 25),
            )),
        Container(
            height: 150,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) =>
                    getItemCard(index)))
      ]),
    );
  }

  Widget getItemCard(index) {
    if (index == 0) {
      return const Card(
          child: ListTile(
        title: Text(
            'On distinguishability criteria for estimating generative models'),
        subtitle: Text('Ian J. Goodfellow | 21 May, 2015'),
      ));
    } else {
      return const Card(
          child: ListTile(
        title: Text(
            'Learning to Efficiently Sample from Diffusion Probabilistic Models'),
        subtitle: Text('Daniel Watson | 7 June, 2021'),
      ));
    }
  }
}
