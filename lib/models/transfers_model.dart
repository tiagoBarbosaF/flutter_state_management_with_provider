import 'package:flutter/material.dart';
import 'package:mybank/models/transfer_model.dart';

class Transfers extends ChangeNotifier {
  final List<Transfer> _transfers = [];

  List<Transfer> get transfers => _transfers;

  addTransfer(Transfer newTransfer) {
    transfers.add(newTransfer);
    notifyListeners();
  }
}
