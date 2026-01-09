/// Extension for shorthand margin helpers via VContainer.
///
/// Example:
/// ```dart
/// Text('Hi').m(8).make();
/// ```
library;

import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/box.dart';

/// Shorthand margin helpers via VContainer.
extension KaeruMarginExtension on Widget {
  /// Wraps the widget in a container with the specified [p] margin.
  Widget mar(EdgeInsetsGeometry p) => box.mar(p).make();
  /// Wraps the widget in a container with the specified margin.
  Widget m(double v, [double? y]) =>
      y == null ? box.m(v).make() : box.mx(v).my(y).make();
  /// Wraps the widget in a container with the specified horizontal [v] margin.
  Widget mx(double v) => box.mx(v).make();
  /// Wraps the widget in a container with the specified vertical [v] margin.
  Widget my(double v) => box.my(v).make();
  /// Wraps the widget in a container with the specified top [v] margin.
  Widget mt(double v) => box.mt(v).make();
  /// Wraps the widget in a container with the specified bottom [v] margin.
  Widget mb(double v) => box.mb(v).make();
  /// Wraps the widget in a container with the specified left [v] margin.
  Widget ml(double v) => box.ml(v).make();
  /// Wraps the widget in a container with the specified right [v] margin.
  Widget mr(double v) => box.mr(v).make();
}