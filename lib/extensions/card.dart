/// Extension to wrap widget in a Card.
///
/// Example:
/// ```dart
/// Text('Card').card(color: Colors.blue, elevation: 4);
/// ```
library;

import 'package:flutter/material.dart';

/// Wraps a widget in a Card.
extension KaeruCardExtension on Widget {
  /// Wraps the widget in a [Card].
  Widget card({
    Key? key,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) {
    return Card(
      key: key,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: this,
    );
  }
}