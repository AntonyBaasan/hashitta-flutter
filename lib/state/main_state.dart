import 'package:flutter/material.dart';

import '../models/run_record.dart';

class MainState extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }

  // label
  String label = 'Hello World';
  void setLabel(String label) {
    this.label = label;
    notifyListeners();
  }

  // run record
  Map<String, RunRecord> _runRecords = Map();

  void insertRunRecord(RunRecord record) {
    _runRecords[record.id] = record;
    notifyListeners();
  }

  void removeRunRecord(RunRecord record) {
    _runRecords.remove(record.id);
    notifyListeners();
  }
}
