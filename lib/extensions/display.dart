import 'package:flutter/material.dart';

extension KaeruDisplayExtension on Widget {
  Widget show(bool show) {
    return show ? this : none;
  }

  /// Always remove (no space).
  Widget get none => const SizedBox.shrink();
}
