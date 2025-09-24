/// Extension for gesture detectors on any widget.
///
/// Example:
/// ```dart
/// Text('Tap me').onTap(() => print('Tapped'));
/// ```

import 'package:flutter/material.dart';

/// Gesture detectors on any widget.
extension KaeruGestureExtension on Widget {
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget onDoubleTap(VoidCallback onDoubleTap) =>
      GestureDetector(onDoubleTap: onDoubleTap, child: this);

  Widget onLongPress(VoidCallback onLongPress) =>
      GestureDetector(onLongPress: onLongPress, child: this);
}
