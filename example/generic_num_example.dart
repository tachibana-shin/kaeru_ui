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
        appBar: AppBar(title: const Text('Generic: num Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of using width and height percentage
              Container(
                color: Colors.blue,
                width: 50.w(context), // 50% of screen width
                height: 25.h(context), // 25% of screen height
                child: const Center(child: Text('50% Width, 25% Height')),
              ),
              const SizedBox(height: 20),
              // Example of EdgeInsets
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: 10.px.merge(5.py),
                color: Colors.red,
                child: const Text('Padding and Margin Example'),
              ),
              const SizedBox(height: 20),
              // Example of using sp for font size
              Text(
                'Text with size 10sp',
                style: TextStyle(
                  fontSize: 10.sp(context),
                ), // 10% of screen width for font size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
