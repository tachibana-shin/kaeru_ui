/// Extension to build Row/Column with gaps from List<Widget>.
///
/// Example:
/// ```dart
/// [Text('1'), Text('2'), Text('3')].hStackWithGap(gap: 8);
/// [Text('A'), Text('B'), Text('C')].vStackWithGap(gap: 12);
/// ```
library;

import 'package:flutter/material.dart';

/// Builds Row/Column with gaps from List<Widget>.
extension KaeruFlexGapExtension on List<Widget> {
  // ===== HStack with gap =====
  /// Creates a [Row] with the given widgets and a [gap] between them.
  Widget hStackWithGap({
    double gap = 0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    if (gap > 0 && length > 1) {
      final List<Widget> spaced = [];
      for (int i = 0; i < length; i++) {
        spaced.add(this[i]);
        if (i != length - 1) spaced.add(SizedBox(width: gap));
      }
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: spaced,
      );
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: this,
    );
  }

  // ===== VStack with gap =====
  /// Creates a [Column] with the given widgets and a [gap] between them.
  Widget vStackWithGap({
    double gap = 0,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisSize mainAxisSize = MainAxisSize.max,
  }) {
    if (gap > 0 && length > 1) {
      final List<Widget> spaced = [];
      for (int i = 0; i < length; i++) {
        spaced.add(this[i]);
        if (i != length - 1) spaced.add(SizedBox(height: gap));
      }
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: spaced,
      );
    }
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: this,
    );
  }
}