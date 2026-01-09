/// Extension to treat String as image URL and build a CircleAvatar.
///
/// Example:
/// ```dart
/// 'https://example.com/a.png'.avatar(radius: 24, backgroundColor: Colors.blueGrey);
/// ```
library;

import 'package:flutter/material.dart';

/// Extension to treat String as image URL and build a CircleAvatar.
extension KaeruAvatar on String {
  /// Builds a CircleAvatar from a string URL.
  ///
  /// Example:
  /// ```dart
  /// 'https://...'.avatar(radius: 32)
  /// ```
  Widget avatar({double radius = 20, Color? backgroundColor}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.grey.shade400,
      backgroundImage: NetworkImage(this),
    );
  }
}