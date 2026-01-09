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
        appBar: AppBar(title: const Text('Animate Extension Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of fadeIn
              const Text('Fade In Example').fadeIn(),

              // Example of slideUp
              const SizedBox(height: 20),
              const Text('Slide Up Example').slideUp(),

              // Example of scale
              const SizedBox(height: 20),
              const Text('Scale Example').scale(),

              // Example of rotate
              const SizedBox(height: 20),
              KaeruAnimation(const Text('Rotate Example')).rotate(),
            ],
          ),
        ),
      ),
    );
  }
}
