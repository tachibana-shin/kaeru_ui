/// Extension to wrap widget with AspectRatio.
///
/// Example:
/// ```dart
/// Container().aspectRatio(16/9);
/// ```

import 'package:flutter/material.dart';

/// Wraps the widget with AspectRatio.
extension KaeruAspectRatio on Widget {
  /// Wraps the widget with AspectRatio
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }
}
