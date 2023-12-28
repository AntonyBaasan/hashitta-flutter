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
              children: _buildCategorySelectionButtons(state),
            ),
            DurationSeletor(
                initDuration: state.lastDuration,
                onChanged: (Duration duration) {
                  // print('duration changed' + duration.toString());
                  state.lastDuration = duration;
                  state.notifyListeners();
                }),
            // TimeSeletor(
            //   timeChanged: (Duration duration) {
            //     print('duration changed' + duration.toString());
            //     state.lastDuration = duration;
            //   },
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {
                    var newRecord = RunRecord(
                      duration: state.lastDuration,
                      createdAt: DateTime.now(),
                      category: state.currCategory,
                    );
                    Navigator.pop(context, newRecord);
                  },
                ),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategorySelectionButtons(MainState state) {
    List<String> caterories = state.categories;
    String selected = state.currCategory;
    List<Widget> buttons = [];
    for (var item in caterories) {
      buttons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              state.setCategory(item);
            },
            child: Text(item),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  item == selected ? Colors.lightBlue : Colors.white,
            )),
      ));
    }
    return buttons;
  }
}
