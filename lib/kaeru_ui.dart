/// Kaeru UI Extension Library
///
/// This library exports all chainable extensions and virtual widgets for concise Flutter UI development.
///
/// Example usage:
/// ```dart
/// import 'package:kaeru_ui/kaeru_ui.dart';
///
/// // Chainable text styling
/// "Hello Kaeru".text.lg.red(600).underline.make().p(12).inkWell(onTap: () => print("Tapped")).fadeIn();
/// ```
///
/// See README.md for full documentation.

export 'extensions/generic/list/flex.dart';
export 'extensions/generic/list/flex_gap.dart';
export 'extensions/generic/list/stack.dart';
export 'extensions/generic/list/wrap.dart';

export 'extensions/generic/color.dart';
export 'extensions/generic/edge_insets.dart';
export 'extensions/generic/future.dart';
export 'extensions/generic/int.dart';
export 'extensions/generic/num.dart';
export 'extensions/generic/stream.dart';
export 'extensions/generic/string_avatar.dart';
export 'extensions/generic/string.dart';

export 'extensions/animate.dart';
export 'extensions/aspect_ratio.dart';
export 'extensions/badge.dart';
export 'extensions/box.dart';
export 'extensions/clip.dart';
export 'extensions/display.dart';
export 'extensions/flex.dart';
export 'extensions/gesture.dart';
export 'extensions/icon.dart';
export 'extensions/image.dart';
export 'extensions/ink_well.dart';
export 'extensions/margin.dart';
export 'extensions/padding.dart';
export 'extensions/positioned.dart';
export 'extensions/responsive.dart';
export 'extensions/spacing.dart';
export 'extensions/text.dart';
export 'extensions/transform.dart';
export 'extensions/visibility.dart';

export 'virtual/v_container.dart';
export 'virtual/v_rich_text.dart';
export 'virtual/v_text.dart';
