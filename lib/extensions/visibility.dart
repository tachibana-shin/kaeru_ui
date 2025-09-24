/// Extension for chainable visibility on any widget.
///
/// Example:
/// ```dart
/// widget.visible(isActive, replacement: Text('Off'));
/// widget.hide;
/// ```

import 'package:flutter/material.dart';

/// Chainable visibility on any widget.
extension KaeruVisibilityExtension on Widget {
  /// Makes the widget visible or invisible based on the [visible] parameter.
  ///
  /// If [visible] is false, the [replacement] widget is shown instead.
  /// Defaults to an empty [SizedBox].
  Widget visible(bool visible, {Widget replacement = const SizedBox.shrink()}) {
    return Visibility(visible: visible, replacement: replacement, child: this);
  }

  /// Hides the widget.
  Widget get hide => Visibility(visible: false, child: this);
}
