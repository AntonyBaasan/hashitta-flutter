import 'package:flutter/material.dart';
import 'package:hashitta/widgets/record_chart.dart';
import 'package:hashitta/widgets/record_list.dart';
import 'package:intl/intl.dart';
import 'package:hashitta/models/run_record.dart';
import 'package:provider/provider.dart';
import 'package:hashitta/state/main_state.dart';
import 'package:grouped_list/grouped_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MainState>();

    return Scaffold(
        //     body: Padding(
        //   padding: const EdgeInsets.only(bottom: 40.0),
        //   child: RecordChart(
        //       records: state.visibleRecords,
        //       onChanged: (record) {
        //         state.removeRunRecord(record);
        //         state.refreshAllRunRecord();
        //       }),
        // )
        body: RecordList(
            records: state.visibleRecords,
            onChanged: (record) {
              state.removeRunRecord(record);
              state.refreshAllRunRecord();
            }));
  }
}
