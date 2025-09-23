import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';
import 'package:kaeru_ui/virtual/v_text.dart';

void main() {
  group('KaeruTextExtension', () {
    test('text getter returns VText with correct data', () {
      const testString = 'Hello, world!';
      final textWidget = const Text(testString);
      final vText = textWidget.text;
      expect(vText, isA<VText>());
      expect(vText.data, testString);
      // Add more property checks if needed
    });
  });
}
