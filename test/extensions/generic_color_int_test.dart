import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('generic: color & int', () {
    test('color channel modifiers and opacity', () {
      const base = Color(0xFF112233);
      expect(KaeruColorOpacity(base).r(0).red, 0);
      expect(KaeruColorOpacity(base).g(255).green, 255);
      expect(KaeruColorOpacity(base).b(128).blue, 128);
      expect(KaeruColorOpacity(base).a(128).alpha, 128);

      final o = KaeruColorOpacity(base).o(0.4);
      expect(o.opacity, closeTo(0.4, 1e-9));
    });

    test('int.color converts int to Color', () {
      const raw = 0xFFABCDEF;
      expect(raw.color, const Color(0xFFABCDEF));
    });
  });
}
