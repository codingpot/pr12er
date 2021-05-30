import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/main.dart';

void main() {
  testWidgets('MainWidget has a load view', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final loadView = find.byType(CircularProgressIndicator);
    expect(loadView, findsOneWidget);

    final titleFinder = find.text('pr12errrrrrrrrrrrrrrrrrrr');
    expect(titleFinder, findsOneWidget);
  });
}
