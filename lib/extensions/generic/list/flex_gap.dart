import 'package:flutter/material.dart';

extension KaeruFlexGapExtension on List<Widget> {
  // ===== HStack with gap =====
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
