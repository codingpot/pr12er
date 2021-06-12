import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

// ignore: must_be_immutable
class PaperAbstractWidget extends StatelessWidget {
  late Paper paper;

  PaperAbstractWidget({Key? key, required this.paper}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Abstract",
              style: TextStyle(fontFamily: 'PermanentMarker', fontSize: 25),
            ),
            Stack(alignment: Alignment.bottomCenter, children: [
              // ignore: sized_box_for_whitespace
              Card(
                  child: Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      height: 150,
                      child: Text(
                        paper.abstract,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ))),
              const Positioned(
                  bottom: -10, child: Icon(Icons.keyboard_arrow_down, size: 50))
            ])
          ],
        ));
  }
}
