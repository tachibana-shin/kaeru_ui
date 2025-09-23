import 'package:flutter/material.dart';
import 'package:kaeru_ui/virtual/v_text.dart';

extension KaeruTextExtension on Text {
  VText get text => VText(
    data,
    style: style,
    align: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    textScaler: textScaler,
    strutStyle: strutStyle,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    semanticsLabel: semanticsLabel,
    semanticsIdentifier: semanticsIdentifier,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
  );
}
