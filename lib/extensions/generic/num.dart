/// Numeric extensions for Kaeru UI.
///
/// Provides percent-based sizing, EdgeInsets shorthands, Duration shorthands, and number formatting.
///
/// Example:
/// ```dart
/// 20.w(context)        // 20% of screen width
/// 8.p                  // EdgeInsets.all(8)
/// 5.seconds            // Duration(seconds: 5)
/// 3.14159.toFixed(2)   // "3.14"
/// ```
library;

import 'package:flutter/material.dart';

/// Numeric extensions for Kaeru UI.
extension KaeruNumExtension on num {
  /// Returns [this]% of screen width.
  ///
  /// Example:
  /// ```dart
  /// 20.w(context); // 20% of screen width
  /// ```
  double w(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.width;

  /// Returns [this]% of screen height.
  ///
  /// Example:
  /// ```dart
  /// 30.h(context); // 30% of screen height
  /// ```
  double h(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.height;

  /// Returns [this]% of screen width for font size.
  ///
  /// Example:
  /// ```dart
  /// 5.sp(context); // 5% of screen width as font size
  /// ```
  double sp(BuildContext context) =>
      (this / 100) * MediaQuery.of(context).size.width;

  /// Horizontal padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.px; // EdgeInsets.symmetric(horizontal: 8)
  /// ```
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: toDouble());

  /// Vertical padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.py; // EdgeInsets.symmetric(vertical: 8)
  /// ```
  EdgeInsets get py => EdgeInsets.symmetric(vertical: toDouble());

  /// All sides padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.p; // EdgeInsets.all(8)
  /// ```
  EdgeInsets get p => EdgeInsets.all(toDouble());

  /// All sides margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.m; // EdgeInsets.all(8)
  /// ```
  EdgeInsets get m => EdgeInsets.all(toDouble());

  /// Top padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.pt; // EdgeInsets.only(top: 8)
  /// ```
  EdgeInsets get pt => EdgeInsets.only(top: toDouble());

  /// Bottom padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.pb; // EdgeInsets.only(bottom: 8)
  /// ```
  EdgeInsets get pb => EdgeInsets.only(bottom: toDouble());

  /// Left padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.pl; // EdgeInsets.only(left: 8)
  /// ```
  EdgeInsets get pl => EdgeInsets.only(left: toDouble());

  /// Right padding EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.pr; // EdgeInsets.only(right: 8)
  /// ```
  EdgeInsets get pr => EdgeInsets.only(right: toDouble());

  /// Horizontal margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.mx; // EdgeInsets.symmetric(horizontal: 8)
  /// ```
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: toDouble());

  /// Vertical margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.my; // EdgeInsets.symmetric(vertical: 8)
  /// ```
  EdgeInsets get my => EdgeInsets.symmetric(vertical: toDouble());

  /// Top margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.mt; // EdgeInsets.only(top: 8)
  /// ```
  EdgeInsets get mt => EdgeInsets.only(top: toDouble());

  /// Bottom margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.mb; // EdgeInsets.only(bottom: 8)
  /// ```
  EdgeInsets get mb => EdgeInsets.only(bottom: toDouble());

  /// Left margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.ml; // EdgeInsets.only(left: 8)
  /// ```
  EdgeInsets get ml => EdgeInsets.only(left: toDouble());

  /// Right margin EdgeInsets.
  ///
  /// Example:
  /// ```dart
  /// 8.mr; // EdgeInsets.only(right: 8)
  /// ```
  EdgeInsets get mr => EdgeInsets.only(right: toDouble());

  /// Returns a [Duration] in seconds.
  ///
  /// Example:
  /// ```dart
  /// 5.seconds; // Duration(seconds: 5)
  /// ```
  Duration get seconds => Duration(seconds: toInt());

  /// Returns a [Duration] in milliseconds.
  ///
  /// Example:
  /// ```dart
  /// 500.milliseconds; // Duration(milliseconds: 500)
  /// ```
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Returns a [Duration] in minutes.
  ///
  /// Example:
  /// ```dart
  /// 2.minutes; // Duration(minutes: 2)
  /// ```
  Duration get minutes => Duration(minutes: toInt());

  /// Returns a [Duration] in hours.
  ///
  /// Example:
  /// ```dart
  /// 1.hours; // Duration(hours: 1)
  /// ```
  Duration get hours => Duration(hours: toInt());

  /// Formats the number to a fixed number of decimal places.
  ///
  /// Example:
  /// ```dart
  /// 3.14159.toFixed(2); // "3.14"
  /// ```
  String toFixed(int fractionDigits) =>
      toDouble().toStringAsFixed(fractionDigits);
}