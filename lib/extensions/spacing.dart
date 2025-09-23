import 'package:flutter/material.dart';

extension KaeruSpacing on num {
  // Horizontal spacing: SizedBox(width: ...)
  Widget get hSpace => SizedBox(width: toDouble());

  // Vertical spacing: SizedBox(height: ...)
  Widget get vSpace => SizedBox(height: toDouble());
}
