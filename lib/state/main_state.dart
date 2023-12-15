import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }

  String label = 'Hello World';
  void setLabel(String label) {
    this.label = label;
    notifyListeners();
  }
}
