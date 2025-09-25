/// Extension for alignment, scrolling, and flex wrappers on any widget.
///
/// Example:
/// ```dart
/// Icon(Icons.home).centered.expand(flex: 2);
/// ```

import 'package:flutter/material.dart';

/// Alignment, scrolling, and flex wrappers on any widget.
extension KaeruFlexWidgetExtension on Widget {
  // ===== Alignment shorthand =====
  /// Aligns the widget to the center.
  Widget get centered => Align(alignment: Alignment.center, child: this);
  /// Aligns the widget to the top left.
  Widget get topLeft => Align(alignment: Alignment.topLeft, child: this);
  /// Aligns the widget to the top right.
  Widget get topRight => Align(alignment: Alignment.topRight, child: this);
  /// Aligns the widget to the bottom left.
  Widget get bottomLeft => Align(alignment: Alignment.bottomLeft, child: this);
  /// Aligns the widget to the bottom right.
  Widget get bottomRight =>
      Align(alignment: Alignment.bottomRight, child: this);
  /// Wraps the widget in an [Align] widget with the specified [alignment].
  Align align(
    Alignment alignment, {
    Key? key,
    double? heightFactor,
    double? widthFactor,
  }) => Align(
    key: key,
    alignment: alignment,
    heightFactor: heightFactor,
    widthFactor: widthFactor,
    child: this,
  );

  // ===== Scrollable =====
  /// Wraps the widget in a [SingleChildScrollView].
  Widget scrollable({
    Axis axis = Axis.vertical,
    bool reverse = false,
    ScrollPhysics? physics,
  }) => SingleChildScrollView(
    scrollDirection: axis,
    reverse: reverse,
    physics: physics,
    child: this,
  );

  // ===== Expanded =====
  /// Wraps the widget in an [Expanded] widget.
  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);

  // ===== Flexible =====
  /// Wraps the widget in a [Flexible] widget.
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
}