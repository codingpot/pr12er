import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/utils/formatter.dart';

void main() {
  group("format numbers", () {
    test('format 1,000 to 1K', () {
      expect(reformatNumbers(1000), "1.0K");
    });
    test('format 10,000 to 10K', () {
      expect(reformatNumbers(10000), "10.0K");
    });
    test('format 100,000 to 100K', () {
      expect(reformatNumbers(100000), "100.0K");
    });
    test('format 1,000,000 to 1M', () {
      expect(reformatNumbers(1000000), "1.0M");
    });
    test('format 1,100 to 1.1K', () {
      expect(reformatNumbers(1100), "1.1K");
    });
  });
}
