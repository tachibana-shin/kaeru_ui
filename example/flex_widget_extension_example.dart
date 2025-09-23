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
        appBar: AppBar(title: const Text('Flex Widget Extension Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using the centered extension
              const Text('Centered Text').centered,
              const SizedBox(height: 20),

              // Using the topLeft alignment extension
              const Text('Top Left Aligned').topLeft,
              const SizedBox(height: 20),

              // Using the topRight alignment extension
              const Text('Top Right Aligned').topRight,
              const SizedBox(height: 20),

              // Using the bottomLeft alignment extension
              const Text('Bottom Left Aligned').bottomLeft,
              const SizedBox(height: 20),

              // Using the bottomRight alignment extension
              const Text('Bottom Right Aligned').bottomRight,
              const SizedBox(height: 20),

              // Using the expand extension
              const Text('Expanded Text').expand(flex: 2),
              const SizedBox(height: 20),

              // Using the flexible extension
              const Text('Flexible Text').flexible(flex: 3, fit: FlexFit.tight),
              const SizedBox(height: 20),

              // Using the scrollable extension
              const Text('Scrollable Text').scrollable(axis: Axis.vertical),
            ],
          ),
        ),
      ),
    );
  }
}
