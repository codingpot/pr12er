import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/main.dart';

void main() {
  testWidgets('MainWidget has a input field and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final inputBox = find.byKey(ValueKey("input-box"));
    expect(inputBox, findsOneWidget);

    final button = find.text("Click Me");
    expect(button, findsOneWidget);
  });
}
