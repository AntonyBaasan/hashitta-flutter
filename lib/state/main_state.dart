import 'package:flutter/material.dart';
import 'package:hashitta/services/run_record_service.dart';

import '../models/run_record.dart';

class MainState extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }

  // categries
  List<String> categories = ['100m', '200m', '400m'];
  String currCategory = '100m';
  void setCategory(String category) {
    this.currCategory = category;
    notifyListeners();
  }

  // last time
  Duration lastDuration = Duration(hours: 0, minutes: 0, seconds: 0);
  void setLastDuration(Duration duration) {
    this.lastDuration = duration;
    notifyListeners();
  }

  // label
  String label = 'Hello World';
  void setLabel(String label) {
    this.label = label;
    notifyListeners();
  }

  // run record
  RunRecordService _runRecordService = new RunRecordService();
  List<RunRecord> visibleRecords = [];

  void getAllRunRecord() async {
    visibleRecords = await _runRecordService.getRunRecords();
    notifyListeners();
  }

  void insertRunRecord(RunRecord record) async {
    await _runRecordService.insertRunRecord(record);
    notifyListeners();
  }

  void removeRunRecord(RunRecord record) async {
    if (record.id != null) {
      await _runRecordService.deleteRunRecord(record.id);
    }
    notifyListeners();
  }
}
