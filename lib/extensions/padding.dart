/// Extension for shorthand padding on any widget.
///
/// Example:
/// ```dart
/// Text('Hello').p(12).px(8);
/// ```

import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/generic/edge_insets.dart';
import 'package:kaeru_ui/extensions/generic/num.dart';

/// Shorthand padding on any widget.
extension KaeruPaddingExtension on Widget {
  /// Wraps the widget in a [Padding] with the specified [insets].
  Widget pad(EdgeInsets insets) => Padding(padding: insets, child: this);
  /// Wraps the widget in a [Padding] with the specified padding.
  Widget p(double v, [double? y]) =>
      Padding(padding: y == null ? v.p : v.px.merge(y.py), child: this);
  /// Wraps the widget in a [Padding] with the specified horizontal [v] padding.
  Widget px(double v) => Padding(padding: v.px, child: this);
  /// Wraps the widget in a [Padding] with the specified vertical [v] padding.
  Widget py(double v) => Padding(padding: v.py, child: this);
  /// Wraps the widget in a [Padding] with the specified top [v] padding.
  Widget pt(double v) => Padding(padding: v.pt, child: this);
  /// Wraps the widget in a [Padding] with the specified bottom [v] padding.
  Widget pb(double v) => Padding(padding: v.pb, child: this);
  /// Wraps the widget in a [Padding] with the specified left [v] padding.
  Widget pl(double v) => Padding(padding: v.pl, child: this);
  /// Wraps the widget in a [Padding] with the specified right [v] padding.
  Widget pr(double v) => Padding(padding: v.pr, child: this);
}