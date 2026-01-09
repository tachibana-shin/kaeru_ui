import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  runApp(const ClipExtensionExample());
}

class ClipExtensionExample extends StatelessWidget {
  const ClipExtensionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Clip Extension Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of rounded clip
              const Text('Rounded Clip')
                  .rounded(20)
                  .box
                  .bg(Colors.blue)
                  .size(100, 100)
                  .alignCenter
                  .make(),

              const SizedBox(height: 20),

              // Example of circular clip
              const Text(
                'Circular Clip',
              ).circle.box.bg(Colors.red).size(100, 100).alignCenter.make(),

              const SizedBox(height: 20),

              // Example of square clip
              const Text(
                'Square Clip',
              ).square(100).box.bg(Colors.green).alignCenter.make(),
            ],
          ),
        ),
      ),
    );
  }
}
