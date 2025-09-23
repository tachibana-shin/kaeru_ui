import 'package:flutter/material.dart';

extension KaeruNumExtension on num {
  double w(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.width;

  double h(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.height;

  double sp(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.width;

  // ===== EdgeInsets shorthand =====
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get py => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get p => EdgeInsets.all(toDouble());
  EdgeInsets get m => EdgeInsets.all(toDouble());
  EdgeInsets get pt => EdgeInsets.only(top: toDouble());
  EdgeInsets get pb => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get pl => EdgeInsets.only(left: toDouble());
  EdgeInsets get pr => EdgeInsets.only(right: toDouble());
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get my => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get mt => EdgeInsets.only(top: toDouble());
  EdgeInsets get mb => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get ml => EdgeInsets.only(left: toDouble());
  EdgeInsets get mr => EdgeInsets.only(right: toDouble());

  // ===== Duration shorthand =====
  Duration get seconds => Duration(seconds: toInt());
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());

  // ===== String formatting =====
  String toFixed(int fractionDigits) =>
      toDouble().toStringAsFixed(fractionDigits);
}
