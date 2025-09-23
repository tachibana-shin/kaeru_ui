import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('clip extension', () {
    test('rounded returns ClipRRect with given radius', () {
      final w = const Text('A').rounded(16);
      expect(w, isA<ClipRRect>());
      final r = w as ClipRRect;
      expect(r.borderRadius, BorderRadius.circular(16));
    });

    test('circle returns ClipOval', () {
      final w = const Text('A').circle;
      expect(w, isA<ClipOval>());
    });

    test('square returns SizedBox with size', () {
      final w = const Text('A').square(42);
      expect(w, isA<SizedBox>());
      final b = w as SizedBox;
      expect(b.width, 42);
      expect(b.height, 42);
    });
  });
}
