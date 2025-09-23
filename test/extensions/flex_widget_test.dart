import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('flex widget extension', () {
    test('alignment shorthands return Align with expected alignment', () {
      expect((const Text('A').centered as Align).alignment, Alignment.center);
      expect((const Text('A').topLeft as Align).alignment, Alignment.topLeft);
      expect((const Text('A').topRight as Align).alignment, Alignment.topRight);
      expect((const Text('A').bottomLeft as Align).alignment, Alignment.bottomLeft);
      expect((const Text('A').bottomRight as Align).alignment, Alignment.bottomRight);
    });

    test('scrollable returns SingleChildScrollView with axis', () {
      final v = const Text('A').scrollable(axis: Axis.vertical) as SingleChildScrollView;
      expect(v.scrollDirection, Axis.vertical);
      final h = const Text('A').scrollable(axis: Axis.horizontal) as SingleChildScrollView;
      expect(h.scrollDirection, Axis.horizontal);
    });

    test('expand and flexible return corresponding widgets with properties', () {
      final e = const Text('A').expand(flex: 2) as Expanded;
      expect(e.flex, 2);
      final f = const Text('A').flexible(flex: 3, fit: FlexFit.tight) as Flexible;
      expect(f.flex, 3);
      expect(f.fit, FlexFit.tight);
    });
  });
}
