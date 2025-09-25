/// Extension for chainable methods on Image widgets.
///
/// Example:
/// ```dart
/// Image.network(url).size(width: 100, height: 60).fitBox(BoxFit.cover);
/// ```

import 'package:flutter/material.dart';

/// Chainable methods on Image widgets.
extension KaeruImageExtension on Image {
  // ===== Size =====
  /// Creates a new [Image] with the specified [width] and [height].
  Widget size({double? width, double? height}) =>
      Image(width: width, height: height, image: image);

  // ===== Fit =====
  /// Creates a new [Image] with the specified [BoxFit].
  Image fitBox(BoxFit f) =>
      Image(image: image, width: width, height: height, fit: f);
}