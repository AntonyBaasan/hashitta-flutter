import 'package:flutter/material.dart';
import 'package:hashitta/models/run_record.dart';
import 'package:hashitta/state/main_state.dart';
import 'package:provider/provider.dart';

import 'models/tab_panel_info.dart';
import 'pages/home_page.dart';
import 'pages/settings_page.dart';
import 'pages/insert_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainState(),
      child: const MaterialApp(home: BottomNavigationBarExample()),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static List<TabPanelInfo> _widgetOptions = <TabPanelInfo>[
    TabPanelInfo(title: 'Home', widget: HomePage()),
    TabPanelInfo(title: 'Settings', widget: SettingsPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<MainState>();

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
          child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(_widgetOptions.elementAt(_selectedIndex).title),
        //   centerTitle: true,
        // ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex).widget,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // open insert record page
            navigateToInserPage(state);
          },
          tooltip: 'New Record',
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 38),
          elevation: 4.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            height: 60,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    icon: const Icon(Icons.home)),
                IconButton(
                    onPressed: () {
                      _onItemTapped(1);
                    },
                    icon: const Icon(Icons.settings))
              ],
            )), // This trailing comma makes auto-formatting nicer for build methods.
      )),
    );
  }

  Future<void> navigateToInserPage(MainState state) async {
    RunRecord? record = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => InsertPage(label: "Hello from Main")));
    if (record == null) {
      state.setLabel("Clicked back button");
    } else {
      state.insertRunRecord(record);
      state.refreshAllRunRecord();
    }
  }
}
