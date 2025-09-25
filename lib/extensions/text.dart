/// Extension to bridge Text to VText for chainable styling.
///
/// Example:
/// ```dart
/// Text('Hello').text.color(Colors.red).size(18).make();
/// ```

import 'package:flutter/material.dart';
import 'package:kaeru_ui/virtual/v_text.dart';

/// Bridges Text to VText for chainable styling.
extension KaeruTextExtension on Text {
  /// Converts a [Text] widget to a [VText] widget for chainable styling.
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