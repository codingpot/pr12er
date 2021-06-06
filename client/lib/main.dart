import 'package:flutter/material.dart';
import 'package:pr12er/service.dart';
import 'package:provider/provider.dart';

import 'screens/detail_screen.dart';
import 'screens/main_screen.dart';

const appName = 'PR12er';

void main() => runApp(MultiProvider(providers: [
      Provider(
        create: (context) => GrpcClient(),
      )
    ], child: const MainApp()));

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}
