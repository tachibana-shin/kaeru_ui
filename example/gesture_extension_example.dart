import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Gesture Extension Example')),
        body: Center(child: GestureExample()),
      ),
    );
  }
}

class GestureExample extends StatelessWidget {
  const GestureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Tap the button below to trigger a callback.'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // This is where the onTap callback will be triggered
            print('Button tapped!');
          },
          child: const Text('Tap Me!'),
        ).onTap(() {
          // Additional functionality can be added here
          print('Gesture detected on button!');
        }),
      ],
    );
  }
}
