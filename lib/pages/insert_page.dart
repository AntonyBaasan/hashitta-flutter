import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hashitta/state/main_state.dart';
import '../widgets/duration_selector.dart';
import '../widgets/time_selector.dart';
import '../models/run_record.dart';

class InsertPage extends StatelessWidget {
  InsertPage({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MainState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildCategorySelectionButtons(
                  state.categories, state.currCategory),
            ),
            DurationSeletor(
                initDuration: state.lastDuration,
                onChanged: (Duration duration) {
                  print('duration changed' + duration.toString());
                  state.lastDuration = duration;
                  state.notifyListeners();
                }),
            // TimeSeletor(
            //   timeChanged: (Duration duration) {
            //     print('duration changed' + duration.toString());
            //     state.lastDuration = duration;
            //   },
            // ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                var newRecord = RunRecord(
                    time: state.lastDuration,
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

  List<Widget> _buildCategorySelectionButtons(
      List<String> list, String selected) {
    List<Widget> buttons = [];
    for (var item in list) {
      buttons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(item),
        ),
      ));
    }
    return buttons;
  }
}
