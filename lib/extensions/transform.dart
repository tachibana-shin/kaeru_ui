/// Extension for chainable transforms on any widget.
///
/// Example:
/// ```dart
/// Icon(Icons.arrow_upward).rotate(pi / 4).translate(dx: 10);
/// ```
library;

import 'package:flutter/material.dart';

/// Chainable transforms on any widget.
extension KaeruWidgetTransform on Widget {
  /// Rotates the widget by [radians].
  Widget rotate(double radians) =>
      Transform.rotate(angle: radians, child: this);

  /// Flips the widget horizontally.
  Widget get flipX => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
    child: this,
  );

  /// Flips the widget vertically.
  Widget get flipY => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..scaleByDouble(1.0, -1.0, 1.0, 1.0),
    child: this,
  );

  /// Translates the widget by [dx] and [dy].
  Widget translate({double dx = 0, double dy = 0}) =>
      Transform.translate(offset: Offset(dx, dy), child: this);
}