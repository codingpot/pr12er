import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/utils/formatter.dart';

void main() {
  group("formatNumbers", () {
    test('format 1000 to 1K', () {
      int number = 1000;
      expect(reformatNumbers(number), "1K");
    });
  });
}
