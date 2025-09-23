import 'package:flutter/material.dart';

extension KaeruIconExtension on Icon {
  // ===== Size =====
  Icon size(double s) => Icon(icon, size: s, color: color);

  // ===== Color =====
  Icon iconColor(Color c) => Icon(icon, size: this.size, color: c);
}
