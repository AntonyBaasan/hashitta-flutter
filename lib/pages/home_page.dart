import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hashitta/state/main_state.dart';
import 'insert_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MainState>();
    return Scaffold(
      body: Column(
        children: [
          // Text(state.label),
          ListView.builder(
            reverse: true,
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: state.visibleRecords.length,
            itemBuilder: (BuildContext cont, int currIndex) {
              String str =
                  state.visibleRecords.elementAt(currIndex).toJson().toString();
              return Container(
                  height: 50, color: Colors.green[600], child: Text(str));
            },
          ),
          ElevatedButton(
            child: Text('Home Page'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
