import 'package:hashitta/models/run_record.dart';

abstract class AbstractRunRecordService {
  Future<List<RunRecord>> getRunRecords();
  Future<RunRecord> insertRunRecord(RunRecord record);
  Future<bool> deleteRunRecord(String? id);
}
