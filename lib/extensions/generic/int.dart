import 'package:flutter/material.dart';

extension KaeruColorInt on int {
  /// Convert int hex like 0xFF112233 to Color
  Color get color => Color(this);
}
