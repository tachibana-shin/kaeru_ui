/// Extension for gesture detectors on any widget.
///
/// Example:
/// ```dart
/// Text('Tap me').onTap(() => print('Tapped'));
/// ```

import 'package:flutter/material.dart';

/// Gesture detectors on any widget.
extension KaeruGestureExtension on Widget {
  /// Wraps the widget in a [GestureDetector] and handles tap events.
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  /// Wraps the widget in a [GestureDetector] and handles double tap events.
  Widget onDoubleTap(VoidCallback onDoubleTap) =>
      GestureDetector(onDoubleTap: onDoubleTap, child: this);

  /// Wraps the widget in a [GestureDetector] and handles long press events.
  Widget onLongPress(VoidCallback onLongPress) =>
      GestureDetector(onLongPress: onLongPress, child: this);
}