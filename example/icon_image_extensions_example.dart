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
        appBar: AppBar(title: const Text('Icon & Image Extensions Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of using icon extensions
              KaeruIconExtension(
                const Icon(Icons.add),
              ).size(30).iconColor(Colors.green),
              const SizedBox(height: 20),
              // Example of using image extensions
              Image.network(
                'https://example.com/a.png',
              ).size(width: 120, height: 80),
              const SizedBox(height: 20),
              Image.network('https://example.com/b.png').fitBox(BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
