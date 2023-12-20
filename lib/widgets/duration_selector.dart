import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';

class DurationSeletor extends StatelessWidget {
  const DurationSeletor(
      {Key? key, required this.initDuration, required this.onChanged});

  final Duration initDuration;
  final ValueSetter<Duration> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Center(
        child: Column(
          children: [
            DurationPicker(
              duration: initDuration,
              baseUnit: BaseUnit.second,
              onChange: (val) {
                this.onChanged(val);
              },
              snapToMins: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
