/// Extension to build a Wrap widget from List<Widget>.
///
/// Example:
/// ```dart
/// [Text('A'), Text('B'), Text('C')].wrap(spacing: 4, runSpacing: 8);
/// ```

import 'package:flutter/material.dart';

/// Builds a Wrap widget from List<Widget>.
extension KaeruWrapExtension on List<Widget> {
  Widget wrap({
    double spacing = 0,
    double runSpacing = 0,
    WrapAlignment alignment = WrapAlignment.start,
    WrapAlignment runAlignment = WrapAlignment.start,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
  }) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: this,
    );
  }
}
