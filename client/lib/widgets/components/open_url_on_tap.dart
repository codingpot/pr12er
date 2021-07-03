import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// OpenURLOnTap is a component that opens the URL in a new tab on tap.
/// It's used to render paper list item and repository list item.
class OpenURLOnTap extends StatelessWidget {
  final String url;
  final Widget? child;

  const OpenURLOnTap({Key? key, required this.url, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          if (await canLaunch(url)) {
            await launch(url);
            return;
          }
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text("$url is not a valid URL"),
            action: SnackBarAction(
              label: "OK",
              textColor: Theme.of(context).colorScheme.onError,
              onPressed: () {},
            ),
          ));
        },
        child: child);
  }
}
