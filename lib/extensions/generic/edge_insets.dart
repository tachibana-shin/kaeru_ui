/// Extension to merge two EdgeInsets.
///
/// Example:
/// ```dart
/// const EdgeInsets.all(8).merge(const EdgeInsets.symmetric(horizontal: 4));
/// ```

import 'package:flutter/material.dart';

/// Merges two EdgeInsets by adding their values.
extension KaeruEdgeInsetsExtension on EdgeInsets {
  /// Merge two EdgeInsets by adding their values.
  ///
  /// Example:
  /// ```dart
  /// EdgeInsets.all(8).merge(EdgeInsets.symmetric(horizontal: 4));
  /// ```
  EdgeInsets merge(EdgeInsets other) {
    return EdgeInsets.only(
      left: left + other.left,
      right: right + other.right,
      top: top + other.top,
      bottom: bottom + other.bottom,
    );
  }
}