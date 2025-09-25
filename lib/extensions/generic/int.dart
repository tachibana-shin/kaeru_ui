/// Extension to convert int hex to Color.
///
/// Example:
/// ```dart
/// 0xFF112233.color   // Color(0xFF112233)
/// ```

import 'package:flutter/material.dart';

/// Converts int to Color.
extension KaeruColorInt on int {
  /// Converts int hex like 0xFF112233 to Color.
  ///
  /// Example:
  /// ```dart
  /// 0xFF112233.color; // Color(0xFF112233)
  /// ```
  Color get color => Color(this);
}