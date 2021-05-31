import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/main.dart';
import 'package:pr12er/utils/extractor.dart';

void main() {
  testWidgets('MainWidget has a load view', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final loadView = find.byType(CircularProgressIndicator);
    expect(loadView, findsOneWidget);

    final titleFinder = find.text('pr12errrrrrrrrrrrrrrrrrrr');
    expect(titleFinder, findsOneWidget);
  });

  test('only id from youtube url should be extracted', () {
    final url = "https://youtu.be/V7_cNTfm2i8";
    String extractedId = Extractor.extractYoutubeId(url);
    expect("V7_cNTfm2i8", extractedId);
  });
}
