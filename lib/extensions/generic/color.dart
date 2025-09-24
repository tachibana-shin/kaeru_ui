/// Color extensions for Kaeru UI.
///
/// Chainable color channel setters, opacity, and semantic palette.
///
/// Example:
/// ```dart
/// Colors.blue.sa(200).o(0.5).secondary;
/// ```

import 'package:flutter/material.dart';

/// Chainable color channel and opacity setters.
extension KaeruColorOpacity on Color {
  /// Sets the red channel.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.sr(128);
  /// ```
  Color sr(int v) => withRed(v);

  /// Sets the green channel.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.sg(128);
  /// ```
  Color sg(int v) => withGreen(v);

  /// Sets the blue channel.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.sb(128);
  /// ```
  Color sb(int v) => withBlue(v);

  /// Sets the alpha channel.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.sa(200);
  /// ```
  Color sa(int opacity) => withAlpha(opacity);

  /// Sets the overall opacity.
  ///
  /// Example:
  /// ```dart
  /// Colors.blue.o(0.5);
  /// ```
  Color o(double opacity) => withValues(alpha: opacity);
}

/// Predefined color palette for Kaeru UI.
class ColorPalette {
  /// Primary / Brand color.
  /// Example: `ColorPalette.primary`
  static Color primary = const Color(0xFF1E88E5);

  /// Secondary color.
  /// Example: `ColorPalette.secondary`
  static Color secondary = const Color(0xFF42A5F5);

  /// Success color.
  /// Example: `ColorPalette.success`
  static Color success = const Color(0xFF4CAF50);

  /// Info color.
  /// Example: `ColorPalette.info`
  static Color info = const Color(0xFF2196F3);

  /// Warning color.
  /// Example: `ColorPalette.warning`
  static Color warning = const Color(0xFFFFC107);

  /// Danger color.
  /// Example: `ColorPalette.danger`
  static Color danger = const Color(0xFFF44336);

  /// Light neutral color.
  /// Example: `ColorPalette.light`
  static Color light = const Color(0xFFF5F5F5);

  /// Medium neutral color.
  /// Example: `ColorPalette.medium`
  static Color medium = const Color(0xFF9E9E9E);

  /// Dark neutral color.
  /// Example: `ColorPalette.dark`
  static Color dark = const Color(0xFF212121);
}

/// Semantic color access for Kaeru UI.
/// Example: `color.primary`, `color.success`
extension KaeruSemanticColor on Color {
  /// Returns the primary color.
  /// Example: `color.primary`
  Color get primary => ColorPalette.primary;

  /// Returns the secondary color.
  /// Example: `color.secondary`
  Color get secondary => ColorPalette.secondary;

  /// Returns the success color.
  /// Example: `color.success`
  Color get success => ColorPalette.success;

  /// Returns the info color.
  /// Example: `color.info`
  Color get info => ColorPalette.info;

  /// Returns the warning color.
  /// Example: `color.warning`
  Color get warning => ColorPalette.warning;

  /// Returns the danger color.
  /// Example: `color.danger`
  Color get danger => ColorPalette.danger;

  /// Returns the light color.
  /// Example: `color.light`
  Color get light => ColorPalette.light;

  /// Returns the medium color.
  /// Example: `color.medium`
  Color get medium => ColorPalette.medium;

  /// Returns the dark color.
  /// Example: `color.dark`
  Color get dark => ColorPalette.dark;
}
