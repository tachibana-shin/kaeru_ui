import 'package:flutter/material.dart';

extension KaeruVisibilityExtension on Widget {
  Widget visible(bool visible, {Widget replacement = const SizedBox.shrink()}) {
    return Visibility(visible: visible, replacement: replacement, child: this);
  }

  Widget get hide => Visibility(visible: false, child: this);
}
