import 'package:flutter/material.dart';

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
    return const MaterialApp(
      home: BottomNavigationBarExample(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_widgetOptions.elementAt(_selectedIndex).title),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex).widget,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // open insert record page
        },
        tooltip: 'Increment',
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
          )
          // child: const <BottomNavigationBarItem>[
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //   ),
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.settings),
          //     label: 'Settings',
          //   ),
          // ],
          // currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
