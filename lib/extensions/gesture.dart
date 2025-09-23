import 'package:flutter/material.dart';

extension KaeruGestureExtension on Widget {
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget onDoubleTap(VoidCallback onDoubleTap) =>
      GestureDetector(onDoubleTap: onDoubleTap, child: this);

  Widget onLongPress(VoidCallback onLongPress) =>
      GestureDetector(onLongPress: onLongPress, child: this);
}
