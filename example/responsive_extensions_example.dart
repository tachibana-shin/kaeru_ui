import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class ResponsiveExtensionsExample extends StatelessWidget {
  const ResponsiveExtensionsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Responsive Extensions Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Example of using responsive width and height
              Container(
                width: 50.w(context), // 50% of screen width
                height: 25.h(context), // 25% of screen height
                color: Colors.blue,
                child: Center(child: Text('50% Width, 25% Height')),
              ),
              SizedBox(height: 20),
              // Example of using EdgeInsets with responsive values
              Padding(
                padding: 10.p, // 10 logical pixels
                child: Container(
                  color: Colors.green,
                  child: Center(child: Text('Padding of 10')),
                ),
              ),
              SizedBox(height: 20),
              // Example of using visibility helpers
              if (context.isSm) // Only visible on small screens
                Text('Visible on Small Screens'),
              if (context.mdOnly) // Only visible on medium screens
                Text('Visible on Medium Screens'),
              if (context.lgOnly) // Only visible on large screens
                Text('Visible on Large Screens'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(ResponsiveExtensionsExample());
}
