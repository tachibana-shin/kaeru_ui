/// Extension for conditional display helpers.
///
/// Example:
/// ```dart
/// widget.show(isVisible);
/// ```

import 'package:flutter/material.dart';

/// Conditional display helpers.
extension KaeruDisplayExtension on Widget {
  Widget show(bool show) {
    return show ? this : none;
  }

  /// Always remove (no space).
  Widget get none => const SizedBox.shrink();
}
