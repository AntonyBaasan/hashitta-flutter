import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimeSeletor extends StatelessWidget {
  const TimeSeletor({Key? key, required this.timeChanged});

  final ValueSetter<TimeOfDay> timeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text('Hello, World!'),
            ElevatedButton(
              onPressed: () {
                showTimer(context);
              },
              child: null,
            ),
            // TimePickerDialog(
            //   initialTime: TimeOfDay.now(),
            //   initialEntryMode: TimePickerEntryMode.dialOnly,
            // ),
            TimePickerSpinner(
              is24HourMode: true,
              isShowSeconds: true,
              normalTextStyle:
                  TextStyle(fontSize: 24, color: Colors.deepOrange),
              highlightedTextStyle:
                  TextStyle(fontSize: 24, color: Colors.green),
              spacing: 50,
              itemHeight: 80,
              isForce2Digits: true,
              time: DateTime(0, 0, 0, 0, 9, 19),
              onTimeChange: (time) {
                this.timeChanged(TimeOfDay.fromDateTime(time));
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> showTimer(BuildContext context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()
            // orientation: Orientation.landscape,
            );
    print(time);
    return;
  }
}
