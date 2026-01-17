import 'package:flutter/material.dart';

extension IconDataExtension on IconData {
  Icon toIcon({
    Key? key,
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
    bool? applyTextScaling,
    BlendMode? blendMode,
    FontWeight? fontWeight,
  }) => Icon(
    this,
    key: key,
    size: size,
    fill: fill,
    weight: weight,
    grade: grade,
    opticalSize: opticalSize,
    color: color,
    shadows: shadows,
    semanticLabel: semanticLabel,
    textDirection: textDirection,
    applyTextScaling: applyTextScaling,
    blendMode: blendMode,
    fontWeight: fontWeight,
  );
}
