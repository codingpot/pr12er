String reformatNumbers(int number) {
  int copyNumber = number;
  int magnitude = 0;

  while (number.abs() >= 1000) {
    magnitude += 1;
    // ignore: parameter_assignments
    copyNumber ~/= 1000;
  }

  return copyNumber.toString() + ['', 'K', 'M', 'G', 'T', 'P'][magnitude];
}
