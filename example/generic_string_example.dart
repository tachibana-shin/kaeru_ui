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
        appBar: AppBar(title: const Text('Generic String Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of string.capitalize
              Text('hello'.capitalize),

              // Example of string.titleCase
              Text('hello world'.titleCase),

              // Example of string.camelCase
              Text('hello_world case'.camelCase),

              // Example of string.snakeCase
              Text('Hello World__X'.snakeCase),

              // Example of string.toInt
              Text('42'.toInt.toString()),

              // Example of string.toDouble
              Text('3.14'.toDouble.toString()),

              // Example of string.isEmail
              Text('a@b.com'.isEmail ? 'Valid Email' : 'Invalid Email'),

              // Example of string.avatar
              'https://example.com/a.png'.avatar(radius: 12),
            ],
          ),
        ),
      ),
    );
  }
}
