/// Extension to wrap widget in Positioned within a Stack.
///
/// Example:
/// ```dart
/// Container().positioned(top: 0, left: 0);
/// ```

import 'package:flutter/material.dart';

/// Wraps widget in Positioned within a Stack.
extension KaeruPositionedX on Widget {
  /// Wraps the built Container into a Positioned widget
  Positioned positioned({
    double? top,
    double? left,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  /// Fill entire Stack
  Positioned get positionedFill => Positioned.fill(child: this);

  /// Shortcuts
  /// Positions the widget at the top left of the stack.
  Positioned pTopLeft({double? top, double? left}) =>
      positioned(top: top ?? 0, left: left ?? 0);

  /// Positions the widget at the top right of the stack.
  Positioned pTopRight({double? top, double? right}) =>
      positioned(top: top ?? 0, right: right ?? 0);

  /// Positions the widget at the bottom left of the stack.
  Positioned pBottomLeft({double? bottom, double? left}) =>
      positioned(bottom: bottom ?? 0, left: left ?? 0);

  /// Positions the widget at the bottom right of the stack.
  Positioned pBottomRight({double? bottom, double? right}) =>
      positioned(bottom: bottom ?? 0, right: right ?? 0);
}