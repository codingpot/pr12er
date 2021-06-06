import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';
import 'package:pr12er/screens/main_screen.dart';
import 'package:pr12er/service.dart';
import 'package:provider/provider.dart';

import 'main_screen_test.mocks.dart';

Widget setup(Widget widget, GrpcClient grpcClient) {
  return Provider(
      create: (context) => grpcClient, child: MaterialApp(home: widget));
}

@GenerateMocks([GrpcClient])
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
      await tester.pumpWidget(setup(MainScreen(), devClient));

      final loadView = find.byType(CircularProgressIndicator);
      expect(loadView, findsOneWidget);
    });

    testWidgets("has clickable list tile", (WidgetTester tester) async {
      final devClient = MockGrpcClient();
      when(devClient.getVideos()).thenAnswer((_) => Future.value(videos));
      await tester.pumpWidget(setup(MainScreen(), devClient));
      await tester.pumpAndSettle();
      final firstTile = find.byKey(const ValueKey("ListTile-0"));
      expect(firstTile, findsOneWidget);
    });
  });
}
