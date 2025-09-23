import 'package:flutter/material.dart';

extension KaeruImageExtension on Image {
  // ===== Size =====
  Widget size({double? width, double? height}) =>
      Image(width: width, height: height, image: image);

  // ===== Fit =====
  Image fitBox(BoxFit f) =>
      Image(image: image, width: width, height: height, fit: f);
}
