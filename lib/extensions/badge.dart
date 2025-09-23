import 'package:flutter/material.dart';

extension KaeruBadgeWidget on Widget {
  Widget badge({
    Color bgColor = Colors.red,
    Color textColor = Colors.white,
    double paddingH = 6,
    double paddingV = 2,
    double borderRadius = 12,
    double fontSize = 12,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        child: this,
      ),
    );
  }
}
