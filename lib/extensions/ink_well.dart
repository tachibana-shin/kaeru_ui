import 'package:flutter/material.dart';

extension KaeruInkWellExtension on Widget {
  Widget inkWell({
    GestureTapCallback? onTap,
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
      child: this,
    );
  }
}
