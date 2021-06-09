String reformatNumbers(int number) {
  double copyNumber = number.toDouble();
  int magnitude = 0;

  while (copyNumber.abs() >= 1000) {
    magnitude += 1;
    // ignore: parameter_assignments
    copyNumber /= 1000;
  }

  return copyNumber.toString() + ['', 'K', 'M', 'G', 'T', 'P'][magnitude];
}
