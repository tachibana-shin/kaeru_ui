import 'package:kaeru_ui/virtual/v_text.dart';

extension KaeruStringExtension on String {
  // ===== Case conversion =====
  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String get titleCase => split(' ')
      .map(
        (word) =>
            word.isEmpty ? '' : '${word[0].toUpperCase()}${word.substring(1)}',
      )
      .join(' ');

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

  String get snakeCase =>
      split(RegExp(r'\s+|_+')).map((w) => w.toLowerCase()).join('_');

  VText get text => VText(this);

  bool get isEmail => RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(this);

  int? get toInt => int.tryParse(this);
  double? get toDouble => double.tryParse(this);
}
