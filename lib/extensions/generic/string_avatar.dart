import 'package:flutter/material.dart';

extension KaeruAvatar on String {
  /// Treat string as image URL
  Widget avatar({double radius = 20, Color? backgroundColor}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? Colors.grey.shade400,
      backgroundImage: NetworkImage(this),
    );
  }
}
