/// String extension methods for Kaeru UI.
///
/// Provides case conversions, parsing, email validation, and chainable text builder.
///
/// Example:
/// ```dart
/// 'hello_world'.camelCase; // "helloWorld"
/// '3.14'.toDouble;         // 3.14
/// 'user@example.com'.isEmail; // true
/// 'Hello'.text.lg.red(600).make();
/// ```

import 'package:kaeru_ui/virtual/v_text.dart';

extension KaeruStringCaseExt on String {
  /// Capitalizes the first letter of the string.
  ///
  /// Example:
  /// ```dart
  /// 'hello'.capitalize; // 'Hello'
  /// ```
  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;

  /// Converts the string to title case.
  ///
  /// Example:
  /// ```dart
  /// 'hello world'.titleCase; // 'Hello World'
  /// ```
  String get titleCase => split(' ')
      .map(
        (word) =>
            word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}',
      )
      .join(' ');

  /// Converts the string to camelCase.
  ///
  /// Example:
  /// ```dart
  /// 'hello_world case'.camelCase; // 'helloWorldCase'
  /// ```
  String get camelCase {
    final words = split(RegExp(r'\s+|_+'));
    if (words.isEmpty) return '';
    return words[0].toLowerCase() +
        words
            .skip(1)
            .map(
              (w) => w.isEmpty ? '' : '${w[0].toUpperCase()}${w.substring(1)}',
            )
            .join('');
  }

  /// Converts the string to snake_case.
  ///
  /// Example:
  /// ```dart
  /// 'Hello World__X'.snakeCase; // 'hello_world_x'
  /// ```
  String get snakeCase =>
      split(RegExp(r'\s+|_+')).map((w) => w.toLowerCase()).join('_');
}

/// Chainable parsing and text builder for String.
///
/// Example:
/// ```dart
/// 'Hi'.text.lg.make();
/// 'a@b.com'.isEmail; // true
/// '42'.toInt; // 42
/// ```
extension KaeruStringParsingExt on String {
  /// Converts the string to a [VText] builder for chainable text styling.
  ///
  /// Example:
  /// ```dart
  /// 'Hello'.text.lg.red(600).make();
  /// ```
  VText get text => VText(this);

  /// Checks if the string is a valid email address.
  ///
  /// Example:
  /// ```dart
  /// 'a@b.com'.isEmail; // true
  /// 'not-an-email'.isEmail; // false
  /// ```
  bool get isEmail => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(this);

  /// Parses the string as an integer, or returns null if invalid.
  ///
  /// Example:
  /// ```dart
  /// '42'.toInt; // 42
  /// 'abc'.toInt; // null
  /// ```
  int? get toInt => int.tryParse(this);

  /// Parses the string as a double, or returns null if invalid.
  ///
  /// Example:
  /// ```dart
  /// '3.14'.toDouble; // 3.14
  /// 'abc'.toDouble; // null
  /// ```
  double? get toDouble => double.tryParse(this);
}
