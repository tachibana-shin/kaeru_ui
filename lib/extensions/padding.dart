import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/generic/num.dart';

extension KaeruPaddingExtension on Widget {
  Widget p(double v) => Padding(padding: v.p, child: this);
  Widget px(double v) => Padding(padding: v.px, child: this);
  Widget py(double v) => Padding(padding: v.py, child: this);
  Widget pt(double v) => Padding(padding: v.pt, child: this);
  Widget pb(double v) => Padding(padding: v.pb, child: this);
  Widget pl(double v) => Padding(padding: v.pl, child: this);
  Widget pr(double v) => Padding(padding: v.pr, child: this);
}
