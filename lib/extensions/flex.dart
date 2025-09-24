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
  Widget get centered => Align(alignment: Alignment.center, child: this);
  Widget get topLeft => Align(alignment: Alignment.topLeft, child: this);
  Widget get topRight => Align(alignment: Alignment.topRight, child: this);
  Widget get bottomLeft => Align(alignment: Alignment.bottomLeft, child: this);
  Widget get bottomRight =>
      Align(alignment: Alignment.bottomRight, child: this);

  // ===== Scrollable =====
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
  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);

  // ===== Flexible =====
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
}
