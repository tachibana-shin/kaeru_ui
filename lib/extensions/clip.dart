import 'package:flutter/material.dart';

extension KaeruWidgetClipExtension on Widget {
  Widget rounded([double radius = 8]) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  Widget get circle => ClipOval(child: this);

  Widget square(double size) =>
      SizedBox(width: size, height: size, child: this);
}
