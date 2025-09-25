/// Extension to wrap any widget in an InkWell with configuration.
///
/// Example:
/// ```dart
/// Text('Click').inkWell(onTap: () => print('InkWell tapped'));
/// ```

import 'package:flutter/material.dart';

/// Wrap any widget in an InkWell with configuration.
extension KaeruInkWellExtension on Widget {
  /// Wraps the widget in an [InkWell].
  Widget inkWell(
    GestureTapCallback? onTap, {
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    MouseCursor? mouseCursor,
    Color? splashColor,
    Color? highlightColor,
    Color? hoverColor,
    BorderRadius? borderRadius,
    WidgetStateProperty<Color?>? overlayColor,
    bool enableFeedback = true,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    void Function(bool)? onFocusChange,
    void Function(TapDownDetails)? onTapDown,
    void Function(TapUpDetails)? onTapUp,
    void Function()? onTapCancel,
    void Function()? onSecondaryTap,
    void Function(TapUpDetails)? onSecondaryTapUp,
    void Function(TapDownDetails)? onSecondaryTapDown,
    void Function()? onSecondaryTapCancel,
    Color? focusColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
    bool excludeFromSemantics = false,
    bool autofocus = false,
    WidgetStatesController? statesController,
    Duration? hoverDuration,
  }) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      mouseCursor: mouseCursor,
      splashColor: splashColor,
      highlightColor: highlightColor,
      hoverColor: hoverColor,
      borderRadius: borderRadius,
      overlayColor: overlayColor,
      enableFeedback: enableFeedback,
      focusNode: focusNode,
      canRequestFocus: canRequestFocus,
      onFocusChange: onFocusChange,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapCancel: onSecondaryTapCancel,
      focusColor: focusColor,
      splashFactory: splashFactory,
      radius: radius,
      customBorder: customBorder,
      excludeFromSemantics: excludeFromSemantics,
      autofocus: autofocus,
      statesController: statesController,
      hoverDuration: hoverDuration,
      child: this,
    );
  }
}