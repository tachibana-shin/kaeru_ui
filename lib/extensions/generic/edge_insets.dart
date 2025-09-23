import 'package:flutter/material.dart';

extension KaeruEdgeInsetsExtension on EdgeInsets {
  /// Merge two EdgeInsets by adding their values
  EdgeInsets merge(EdgeInsets other) {
    return EdgeInsets.only(
      left: left + other.left,
      right: right + other.right,
      top: top + other.top,
      bottom: bottom + other.bottom,
    );
  }
}
