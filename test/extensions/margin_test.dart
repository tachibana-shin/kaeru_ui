import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('KaeruMarginExtension on Widget (via box + make)', () {
    test('m/mx/my set margin on resulting Container', () {
      const v = 10.0;
      final cAll = const Text('A').m(v) as Container;
      expect(cAll.margin, const EdgeInsets.all(v));

      final cX = const Text('A').mx(v) as Container;
      expect(cX.margin, const EdgeInsets.symmetric(horizontal: v));

      final cY = const Text('A').my(v) as Container;
      expect(cY.margin, const EdgeInsets.symmetric(vertical: v));
    });

    test('mt/mb/ml/mr set directional margins', () {
      const v = 7.0;
      expect(
        (const Text('A').mt(v) as Container).margin,
        const EdgeInsets.only(top: v),
      );
      expect(
        (const Text('A').mb(v) as Container).margin,
        const EdgeInsets.only(bottom: v),
      );
      expect(
        (const Text('A').ml(v) as Container).margin,
        const EdgeInsets.only(left: v),
      );
      expect(
        (const Text('A').mr(v) as Container).margin,
        const EdgeInsets.only(right: v),
      );
    });
  });
}
