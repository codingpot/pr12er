import 'package:flutter/material.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

// ignore: must_be_immutable
class PaperAbstractWidget extends StatelessWidget {
  late Paper paperAbstract;

  PaperAbstractWidget({Key? key, required this.paperAbstract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('hello world'),
    );
  }
}
