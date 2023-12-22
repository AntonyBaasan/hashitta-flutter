import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hashitta/models/run_record.dart';
import 'package:provider/provider.dart';
import 'package:hashitta/state/main_state.dart';
import '../utils/date_helper.dart';
import 'insert_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MainState>();

    return Scaffold(
      body: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: state.visibleRecords.length,
        itemBuilder: (BuildContext cont, int currIndex) {
          // String str =
          //     state.visibleRecords.elementAt(currIndex).toJson().toString();
          RunRecord record = state.visibleRecords.elementAt(currIndex);

          return Container(
              // decoration: BoxDecoration(
              //     border: Border.all(color: Colors.blueAccent)),
              height: 50,
              child: Row(
                children: [
                  // Text(record.id ?? ""),
                  Container(
                      width: 90,
                      child: Text(DateFormat.yMMMd().format(record.createdAt))),
                  VerticalDivider(thickness: 1, width: 1),
                  Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: Text(record.category)),
                  VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(DateHelper.durationToString(record.duration)),
                  )),
                  ElevatedButton(
                    child: Text('Delete'),
                    onPressed: () {
                      state.removeRunRecord(
                          state.visibleRecords.elementAt(currIndex));
                      state.refreshAllRunRecord();
                    },
                  ),
                ],
              ));
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
    );
  }
}
