import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hashitta/models/run_record.dart';
import 'package:hashitta/utils/date_helper.dart';

class RecordList extends StatelessWidget {
  const RecordList({Key? key, required this.records, required this.onChanged});

  final List<RunRecord> records;
  final ValueSetter<RunRecord> onChanged;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<RunRecord, String>(
        elements: records,
        groupBy: (element) => element.dayOfRun,
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (element1, element2) =>
            element1.createdAt.compareTo(element2.createdAt),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
        itemBuilder: (context, record) {
          return Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
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
                        onChanged(record);
                        // state.removeRunRecord(record);
                        // state.refreshAllRunRecord();
                      },
                    ),
                  ],
                ),
              ));
        });
  }
}
