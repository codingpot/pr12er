import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/screens/main_screen.dart';
import 'package:pr12er/service.dart';
import 'package:pr12er/view_models/view_model_videos.dart';
import 'package:provider/provider.dart';

import 'main_screen_with_mocks_test.mocks.dart';

@GenerateMocks([GrpcClient, CustomTheme, FavoriteVideoViewModel])
void main() {
  group("MainScreen()", () {
    late List<Video> videos;

    setUp(() {
      final video1 = Video()
        ..title = "title1"
        ..prId = 1
        ..link = "video-link1";
      final video2 = Video()
        ..title = "title2"
        ..prId = 2
        ..link = "video-link2";
      videos = List.of([video1, video2]);
    });

    testWidgets('MainWidget has a load view', (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));
      await tester.pumpWidget(MultiProvider(
        providers: [
          Provider<GrpcClient>(create: (context) => devClient),
          ChangeNotifierProvider(create: (context) => null),
        ],
        builder: (context, child) => MainScreen(),
      ));

      final loadView = find.byType(CircularProgressIndicator);
      expect(loadView, findsOneWidget);
    });

    testWidgets("has clickable list tile", (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));

      final mockVM = MockFavoriteVideoViewModel();
      when(mockVM.favoriteVideosMap).thenAnswer((_) => Future.value({}));
      when(mockVM.isFavoriteVideo(1)).thenAnswer((_) => Future.value(false));
      when(mockVM.isFavoriteVideo(2)).thenAnswer((_) => Future.value(false));
      await tester.pumpWidget(MultiProvider(
        providers: [
          Provider<GrpcClient>(create: (context) => devClient),
          ChangeNotifierProvider(create: (context) => null),
          ChangeNotifierProvider<FavoriteVideoViewModel>(
              create: (context) => mockVM),
        ],
        builder: (context, child) => MaterialApp(home: MainScreen()),
      ));
      await tester.pumpAndSettle();
      final firstTile = find.byKey(const ValueKey("ListTile-1"));
      expect(firstTile, findsOneWidget);
    });

    testWidgets("Clicking the toggle dark/light mode changes the theme",
        (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));

      final mockTheme = MockCustomTheme();
      when(mockTheme.themeMode).thenReturn(ThemeMode.dark);
      when(mockTheme.icon).thenReturn(Icons.dark_mode);
      when(mockTheme.text).thenReturn("다크모드");

      final mockVM = MockFavoriteVideoViewModel();
      when(mockVM.favoriteVideosMap).thenAnswer((_) => Future.value({}));
      when(mockVM.isFavoriteVideo(1)).thenAnswer((_) => Future.value(false));
      when(mockVM.isFavoriteVideo(2)).thenAnswer((_) => Future.value(false));

      await tester.pumpWidget(MultiProvider(
        providers: [
          Provider<GrpcClient>(create: (context) => devClient),
          ChangeNotifierProvider<CustomTheme>(create: (context) => mockTheme),
          ChangeNotifierProvider<FavoriteVideoViewModel>(
              create: (context) => mockVM),
        ],
        builder: (context, child) => MaterialApp(home: MainScreen()),
      ));
      await tester.pumpAndSettle();

      // GIVEN the theme toggle button.
      final popupMenuBtn = find.byKey(const ValueKey("popup-menu-button"));
      await tester.tap(popupMenuBtn);
      await tester.pumpAndSettle();

      // WHEN the toggle button is clicked.
      final btn = find.byKey(const ValueKey("icon-theme-toggle-button"));
      await tester.tap(btn);

      // THEN toggleMode function has been called.
      verify(mockTheme.toggleMode()).called(1);
    });
  });
}
