import 'package:flutter/material.dart';
import 'package:pr12er/service.dart';
import 'package:pr12er/sort_preference.dart';
import 'package:pr12er/view_models/view_model_videos.dart';
import 'package:provider/provider.dart';

import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/screens/detail_screen.dart';
import 'package:pr12er/screens/main_screen.dart';

const appName = 'PR12er';

void main() => runApp(MultiProvider(providers: [
      Provider(
        create: (context) => GrpcClient(),
      ),
      ChangeNotifierProvider(
        create: (context) => CustomTheme(),
      ),
      ChangeNotifierProvider<FavoriteVideoViewModel>(
        create: (context) => FavoriteVideoViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SortMode(),
      ),
    ], child: const MainApp()));

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomTheme>(
      builder: (context, theme, _child) => MaterialApp(
        title: appName,
        initialRoute: MainScreen.routeName,
        darkTheme: CustomTheme.darkTheme,
        theme: CustomTheme.lightTheme,
        themeMode: theme.themeMode,
        debugShowCheckedModeBanner: false,
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          DetailScreen.routeName: (context) => DetailScreen(),
        },
      ),
    );
  }
}
