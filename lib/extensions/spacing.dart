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
  Widget get hSpace => SizedBox(width: toDouble());
  Widget get widthBox => hSpace;

  // Vertical spacing: SizedBox(height: ...)
  Widget get vSpace => SizedBox(height: toDouble());
  Widget get heightBox => vSpace;
}
