import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../widgets/time_selector.dart';
import '../models/run_record.dart';

class InsertPage extends StatelessWidget {
  InsertPage({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TimeSeletor(
              timeChanged: (TimeOfDay time) {
                print('time changed' + time.toString());
              },
            ),
            Text(this.label),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                var newRecord = RunRecord(
                    id: Uuid().v1().toString(),
                    time: TimeOfDay.now(),
                    createdAt: DateTime.now(),
                    category: 'caterory1',
                    runner: 'runner1');
                Navigator.pop(context, newRecord);
              },
            ),
          ],
        ),
      ),
    );
  }
}
