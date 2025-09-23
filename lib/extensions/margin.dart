import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/box.dart';

extension KaeruMarginExtension on Widget {
  Widget mar(EdgeInsetsGeometry p) => box.mar(p).make();
  Widget m(double v, [double? y]) =>
      y == null ? box.m(v).make() : box.mx(v).my(y).make();
  Widget mx(double v) => box.mx(v).make();
  Widget my(double v) => box.my(v).make();
  Widget mt(double v) => box.mt(v).make();
  Widget mb(double v) => box.mb(v).make();
  Widget ml(double v) => box.ml(v).make();
  Widget mr(double v) => box.mr(v).make();
}
