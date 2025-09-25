/// Extension to build a Stack widget from List<Widget>.
///
/// Example:
/// ```dart
/// [Container(color: Colors.red), Text("On top")].stack(alignment: Alignment.center)
/// ```

import 'package:flutter/material.dart';

/// Builds a Stack widget from List<Widget>.
extension KaeruStackListExt on List<Widget> {
  /// Creates a [Stack] with the given widgets.
  ///
  /// Example:
  /// ```dart
  /// [
  ///   Container(color: Colors.red, width: 100, height: 100),
  ///   Text("On top"),
  /// ].stack(alignment: Alignment.center)
  /// ```
  Widget stack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      key: key,
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: this,
    );
  }
}