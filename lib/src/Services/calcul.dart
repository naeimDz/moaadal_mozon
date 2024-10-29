double calculMoyen(double m1, List<double> m2) {
  double sumOfElements = m2.reduce((value, element) => value + element);
  double average = ((sumOfElements / m2.length) + (m1 * 2)) / 3;
  return average;
}
