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
    const cardPadding = EdgeInsets.all(15);

    if (_isExpanded) {
      return Card(
          child: Padding(
        padding: cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.text,
              style: textStyle,
              softWrap: true,
            ),
            IconButton(
                iconSize: iconSize,
                onPressed: onPressed,
                color: Theme.of(context).accentColor,
                icon: const Icon(Icons.keyboard_arrow_up)),
          ],
        ),
      ));
    }

    return Card(
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
            padding: cardPadding,
            child: Text(
              widget.text,
              overflow: TextOverflow.fade,
              maxLines: 3,
              style: textStyle,
            )),
        Positioned(
            bottom: iconSize / 3,
            child: IconButton(
                iconSize: iconSize,
                onPressed: onPressed,
                color: Theme.of(context).accentColor,
                icon: const Icon(Icons.keyboard_arrow_down)))
      ]),
    );
  }

  void onPressed() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
