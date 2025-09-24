/// Extension to wrap widget in a badge-style container.
///
/// Example:
/// ```dart
/// Text('5').badge(bgColor: Colors.green, fontSize: 14);
/// ```

import 'package:flutter/material.dart';

/// Wraps a widget in a badge-style container.
extension KaeruBadgeWidget on Widget {
  Widget badge({
    Color bgColor = Colors.red,
    Color textColor = Colors.white,
    double paddingH = 6,
    double paddingV = 2,
    double borderRadius = 12,
    double fontSize = 12,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        child: this,
      ),
    );
  }
}
