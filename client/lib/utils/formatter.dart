import 'package:sprintf/sprintf.dart';

String reformatNumbers(int number) {
  int copyNumber = number;
  int magnitude = 0;

  while (number.abs() >= 1000) {
    magnitude += 1;
    // ignore: parameter_assignments
    copyNumber ~/= 1000;
  }

  return sprintf('%d%s', [
    copyNumber,
    ['', 'K', 'M', 'G', 'T', 'P'][magnitude]
  ]);
}
