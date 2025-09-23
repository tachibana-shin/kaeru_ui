import 'package:flutter/material.dart';

extension KaeruAspectRatio on Widget {
  /// Wraps the widget with AspectRatio
  Widget aspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }
}
