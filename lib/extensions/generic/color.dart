import 'package:flutter/material.dart';

extension KaeruColorOpacity on Color {
  /// Chainable opacity
  Color r(int v) => withRed(v);
  Color g(int v) => withGreen(v);
  Color b(int v) => withBlue(v);
  Color a(int opacity) => withAlpha(opacity);

  Color o(double opacity) => withValues(alpha: opacity);
}

class ColorPalette {
  /// Primary / Brand
  static Color primary = const Color(0xFF1E88E5);
  static Color secondary = const Color(0xFF42A5F5);

  /// Semantic colors
  static Color success = const Color(0xFF4CAF50);
  static Color info = const Color(0xFF2196F3);
  static Color warning = const Color(0xFFFFC107);
  static Color danger = const Color(0xFFF44336);

  /// Neutral / grayscale
  static Color light = const Color(0xFFF5F5F5);
  static Color medium = const Color(0xFF9E9E9E);
  static Color dark = const Color(0xFF212121);
}

extension KaeruSemanticColor on Color {
  Color get primary => ColorPalette.primary;
  Color get secondary => ColorPalette.secondary;
  Color get success => ColorPalette.success;
  Color get info => ColorPalette.info;
  Color get warning => ColorPalette.warning;
  Color get danger => ColorPalette.danger;

  Color get light => ColorPalette.light;
  Color get medium => ColorPalette.medium;
  Color get dark => ColorPalette.dark;
}
