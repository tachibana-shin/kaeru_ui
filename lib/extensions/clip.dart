/// Extension for quick clipping methods on any widget.
///
/// Example:
/// ```dart
/// Image.network(url).circle;
/// Container().rounded(12);
/// ```

import 'package:flutter/material.dart';

/// Quick clipping methods on any widget.
extension KaeruWidgetClipExtension on Widget {
  /// Clips the widget with rounded corners.
  Widget rounded([double radius = 8]) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  /// Clips the widget into a circle.
  Widget get circle => ClipOval(child: this);

  /// Constrains the widget to a square of the given [size].
  Widget square(double size) =>
      SizedBox(width: size, height: size, child: this);

  /// Constrains the widget to the given [width].
  Widget width(double width) => SizedBox(width: width, child: this);
  /// Constrains the widget to the given [height].
  Widget height(double height) => SizedBox(height: height, child: this);
  /// Constrains the widget to the given [width] and [height].
  Widget size(double width, double height) =>
      SizedBox(width: width, height: height, child: this);

  /// Wraps the widget in a [ClipRect].
  Widget clip({
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) => ClipRect(clipper: clipper, clipBehavior: clipBehavior, child: this);
}