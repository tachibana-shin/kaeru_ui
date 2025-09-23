import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Badge Extension Example')),
        body: Center(child: const Text('9').badge()),
      ),
    );
  }
}
