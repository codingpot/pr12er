import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (_isExpanded) {
      return Card(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              softWrap: true,
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.keyboard_arrow_up, size: 50)),
          ],
        ),
      ));
    }

    return Stack(alignment: Alignment.bottomCenter, children: [
      Card(
          child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              height: 100,
              child: Text(
                widget.text,
                overflow: TextOverflow.fade,
                maxLines: 3,
                softWrap: true,
              ))),
      Positioned(
          bottom: 10,
          child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.keyboard_arrow_down, size: 50)))
    ]);
  }

  void onPressed() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}