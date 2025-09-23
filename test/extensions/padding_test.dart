import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('KaeruPaddingExtension on Widget', () {
    test('p and px/py add correct EdgeInsets', () {
      const v = 8.0;
      final pAll = const Text('A').p(v) as Padding;
      expect(pAll.padding, const EdgeInsets.all(v));

      final pX = const Text('A').px(v) as Padding;
      expect(pX.padding, const EdgeInsets.symmetric(horizontal: v));

      final pY = const Text('A').py(v) as Padding;
      expect(pY.padding, const EdgeInsets.symmetric(vertical: v));
    });

    test('pt/pb/pl/pr apply directional padding', () {
      const v = 12.0;
      expect((const Text('A').pt(v) as Padding).padding, const EdgeInsets.only(top: v));
      expect((const Text('A').pb(v) as Padding).padding, const EdgeInsets.only(bottom: v));
      expect((const Text('A').pl(v) as Padding).padding, const EdgeInsets.only(left: v));
      expect((const Text('A').pr(v) as Padding).padding, const EdgeInsets.only(right: v));
    });
  });
}
