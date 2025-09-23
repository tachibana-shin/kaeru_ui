import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('KaeruSpacing (num)', () {
    test('hSpace creates SizedBox with width', () {
      const w = 10.0;
      final box = w.hSpace as SizedBox;
      expect(box.width, w);
      expect(box.height, isNull);
    });

    test('vSpace creates SizedBox with height', () {
      const h = 6.0;
      final box = h.vSpace as SizedBox;
      expect(box.height, h);
      expect(box.width, isNull);
    });
  });
}
