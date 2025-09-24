/// Extension for chainable size and color setters on Icon.
///
/// Example:
/// ```dart
/// Icon(Icons.add).size(30).iconColor(Colors.green);
/// ```

import 'package:flutter/material.dart';

/// Chainable size and color setters on Icon.
extension KaeruIconExtension on Icon {
  // ===== Size =====
  Icon size(double s) => Icon(icon, size: s, color: color);

  // ===== Color =====
  Icon iconColor(Color c) => Icon(icon, size: this.size, color: c);
}
