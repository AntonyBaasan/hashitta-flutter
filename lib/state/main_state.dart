import 'package:flutter/material.dart';
import 'package:hashitta/services/run_record_service_db.dart';
import 'package:hashitta/services/run_record_service_inmemory.dart';

import '../models/run_record.dart';
import '../services/abstract_run_record_service.dart';

class MainState extends ChangeNotifier {
  MainState() {
    refreshAllRunRecord();
  }
  // counter
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

  // user info
  String currUser = 'user1';

  // run record
  AbstractRunRecordService _runRecordService = new RunRecordServiceDb();
  // AbstractRunRecordService _runRecordService = new RunRecordServiceInMemory();
  List<RunRecord> visibleRecords = [];

  void refreshAllRunRecord() async {
    print("refreshAllRunRecord");
    visibleRecords = await _runRecordService.getRunRecords();
    notifyListeners();
  }

  void insertRunRecord(RunRecord record) async {
    record.runner = currUser;
    await _runRecordService.insertRunRecord(record);
    notifyListeners();
  }

  void removeRunRecord(RunRecord record) async {
    // print(record.toJson().toString());
    if (record.id != null) {
      await _runRecordService.deleteRunRecord(record.id);
    }
    notifyListeners();
  }
}
