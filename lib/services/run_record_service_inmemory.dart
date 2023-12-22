import 'package:hashitta/models/run_record.dart';
import 'package:uuid/uuid.dart';

import 'abstract_run_record_service.dart';

class RunRecordServiceInMemory implements AbstractRunRecordService {
  Map<String, RunRecord> _runRecords = Map();

  Future<List<RunRecord>> getRunRecords() async {
    return _runRecords.values.toList();
  }

  Future<RunRecord> insertRunRecord(RunRecord record) async {
    var id = Uuid().v1().toString();
    record.id = id;
    _runRecords[id] = record;
    return record;
  }

  Future<bool> deleteRunRecord(String? id) async {
    if (_runRecords.remove(id) == null) {
      return false;
    }
    return true;
  }
}
