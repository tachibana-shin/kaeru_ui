import 'package:flutter/material.dart';

import '../virtual/v_container.dart';

extension KaeruBoxExtension on Widget {
  // ===== Wrap with Container shorthand =====
  VContainer get box => VContainer(child: this);
}
