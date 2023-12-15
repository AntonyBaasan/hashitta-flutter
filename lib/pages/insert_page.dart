import 'package:flutter/material.dart';

class InsertPage extends StatelessWidget {
  InsertPage({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Time'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(this.label),
            ElevatedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context, 'Hello from Insert Page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
