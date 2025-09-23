import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  // Example for color channel modifiers and opacity
  const Color baseColor = Color(0xFF112233);

  // Modifying color channels
  final modifiedColor = baseColor
      .sr(0) // Red channel set to 0
      .sg(255) // Green channel set to 255
      .sb(128) // Blue channel set to 128
      .sa(128) // Alpha channel set to 128
      .o(0.4); // Setting opacity to 0.4

  print('Modified Color: ${modifiedColor.toString()}');

  // Example for converting int to Color
  const int rawColor = 0xFFABCDEF;
  final Color colorFromInt = rawColor.color;
  print('Color from int: $colorFromInt');

  // Example of using color in a widget
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Color & Int Example')),
        body: Center(
          child: Container(
            width: 100,
            height: 100,
            color: colorFromInt,
            child: Center(
              child: Text('Color Box', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    ),
  );
}
