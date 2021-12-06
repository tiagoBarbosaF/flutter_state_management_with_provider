import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Balance extends ChangeNotifier {
  double value;

  Balance(this.value);

  void addBalance(double value) {
    this.value += value;

    notifyListeners();
  }

  void subtratic(double value) {
    this.value -= value;

    notifyListeners();
  }

  @override
  String toString() {
    return NumberFormat.simpleCurrency(
            name: 'BRL', locale: 'pt_BR', decimalDigits: 2)
        .format(value);
  }
}
