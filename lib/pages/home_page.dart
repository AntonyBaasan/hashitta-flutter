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
      body: Center(
        child: Column(
          children: [
            Text(state.label),
            ElevatedButton(
              child: Text('Home Page'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
