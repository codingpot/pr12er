import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pr12er/custom_theme.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/protos/pkg/pr12er/service.pb.dart';
import 'package:pr12er/screens/main_screen.dart';
import 'package:pr12er/service.dart';
import 'package:provider/provider.dart';

import 'main_screen_test_with_mocks.mocks.dart';

Widget setup(
    {required Widget widget, GrpcClient? grpcClient, CustomTheme? theme}) {
  return MultiProvider(providers: [
    Provider(create: (context) => grpcClient),
    ChangeNotifierProvider(create: (context) => theme),
  ], child: MaterialApp(home: widget));
}

@GenerateMocks([GrpcClient, CustomTheme])
void main() {
  group("MainScreen()", () {
    late List<Video> videos;
    late MockGrpcClient devClient;

    setUp(() {
      final video1 = Video()..title = "title1";
      final video2 = Video()..title = "title2";
      videos = List.of([video1, video2]);
      devClient = MockGrpcClient();
    });

    testWidgets('MainWidget has a load view', (WidgetTester tester) async {
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));
      await tester
          .pumpWidget(setup(widget: MainScreen(), grpcClient: devClient));

      final loadView = find.byType(CircularProgressIndicator);
      expect(loadView, findsOneWidget);
    });

    testWidgets("has clickable list tile", (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));
      await tester
          .pumpWidget(setup(widget: MainScreen(), grpcClient: devClient));
      await tester.pumpAndSettle();
      final firstTile = find.byKey(const ValueKey("ListTile-0"));
      expect(firstTile, findsOneWidget);
    });

    testWidgets("Clicking the toggle dark/light mode changes the theme",
        (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));

      final mockTheme = MockCustomTheme();
      final oldThemeMode = mockTheme.themeMode;

      await tester.pumpWidget(
          setup(widget: MainScreen(), grpcClient: devClient, theme: mockTheme));
      await tester.pumpAndSettle();

      // GIVEN the theme toggle button.
      final btn = find.byKey(const ValueKey("icon-theme-toggle-button"));
      expect(btn, findsOneWidget);

      // WHEN the toggle button is clicked.
      await tester.tap(btn);

      // THEN toggleMode function has been called.
      verify(mockTheme.toggleMode()).called(1);
      // THEN themeMode should have changed.
      expect(mockTheme.themeMode, isNot(oldThemeMode));
    });

    testWidgets("Clicking the create issue button should send request",
        (WidgetTester tester) async {
      // GIVEN a user enters the main screen.
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));
      final req = ReportRequest();
      when(devClient.report(req))
          .thenAnswer((_) => Future.value(ReportResponse()));
      await tester
          .pumpWidget(setup(widget: MainScreen(), grpcClient: devClient));
      await tester.pumpAndSettle();

      // WHEN a user clicks send a request.

      // THEN it should send a gRPC request.
    });
  });
}
