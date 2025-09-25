/// Numeric spacing shortcuts for SizedBox.
///
/// Example:
/// ```dart
/// 5.0.hSpace;
/// 10.0.vSpace;
/// ```

import 'package:flutter/material.dart';

/// Numeric spacing shortcuts for SizedBox.
extension KaeruSpacing on num {
  // Horizontal spacing: SizedBox(width: ...)
  /// Creates a [SizedBox] with the given width.
  Widget get hSpace => SizedBox(width: toDouble());
  /// Creates a [SizedBox] with the given width.
  Widget get widthBox => hSpace;

  // Vertical spacing: SizedBox(height: ...)
  /// Creates a [SizedBox] with the given height.
  Widget get vSpace => SizedBox(height: toDouble());
  /// Creates a [SizedBox] with the given height.
  Widget get heightBox => vSpace;
}