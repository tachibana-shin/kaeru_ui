/// Extension to start a chainable Container builder via VContainer.
///
/// Example:
/// ```dart
/// Text('A').box.bg(Colors.red).rounded(4).make();
/// ```
library;

import 'package:flutter/material.dart';

import '../virtual/v_container.dart';

/// Begins a chainable Container builder via VContainer.
extension KaeruBoxExtension on Widget {
  // ===== Wrap with Container shorthand =====
  /// Begins a chainable [VContainer] builder.
  VContainer get box => VContainer(child: this);
}