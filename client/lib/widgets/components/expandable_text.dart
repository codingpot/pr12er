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
    final textStyle = Theme.of(context).textTheme.subtitle1;
    const double iconSize = 35;

    if (_isExpanded) {
      return Card(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: textStyle,
            ),
            IconButton(
                iconSize: iconSize,
                onPressed: onPressed,
                icon: const Icon(Icons.keyboard_arrow_up)),
          ],
        ),
      ));
    }

    return Stack(alignment: Alignment.bottomCenter, children: [
      Card(
          child: Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                widget.text,
                overflow: TextOverflow.fade,
                maxLines: 3,
                style: textStyle,
              ))),
      Positioned(
          bottom: iconSize / 3,
          child: IconButton(
              iconSize: iconSize,
              onPressed: onPressed,
              icon: const Icon(Icons.keyboard_arrow_down)))
    ]);
  }

  void onPressed() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
