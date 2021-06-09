String reformatNumbers(int number) {
  double copyNumber = number.toDouble();
  int magnitude = 0;

  while (copyNumber.abs() >= 1000) {
    magnitude += 1;
    // ignore: parameter_assignments
    copyNumber /= 1000;
  }

  String numberString = copyNumber.toString();
  if (numberString.substring(numberString.length - 2) == ".0") {
    numberString = numberString.substring(0, numberString.length - 2);
  }

  return numberString + ['', 'K', 'M', 'G', 'T', 'P'][magnitude];
}
