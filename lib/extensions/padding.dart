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
  Widget pad(EdgeInsets insets) => Padding(padding: insets, child: this);
  Widget p(double v, [double? y]) =>
      Padding(padding: y == null ? v.p : v.px.merge(y.py), child: this);
  Widget px(double v) => Padding(padding: v.px, child: this);
  Widget py(double v) => Padding(padding: v.py, child: this);
  Widget pt(double v) => Padding(padding: v.pt, child: this);
  Widget pb(double v) => Padding(padding: v.pb, child: this);
  Widget pl(double v) => Padding(padding: v.pl, child: this);
  Widget pr(double v) => Padding(padding: v.pr, child: this);
}
