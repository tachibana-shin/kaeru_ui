import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('generic: num', () {
    testWidgets('w/h/sp percent based sizing and EdgeInsets shorthands', (
      tester,
    ) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(200, 100)),
            child: Container(key: key),
          ),
        ),
      );

      final ctx = key.currentContext!;
      expect(50.w(ctx), 100); // 50% of width 200
      expect(25.h(ctx), 25); // 25% of height 100
      expect(10.sp(ctx), 20); // 10% of width 200

      // EdgeInsets
      const v = 8.0;
      expect(v.p, const EdgeInsets.all(v));
      expect(v.px, const EdgeInsets.symmetric(horizontal: v));
      expect(v.py, const EdgeInsets.symmetric(vertical: v));
      expect(v.pt, const EdgeInsets.only(top: v));
      expect(v.pb, const EdgeInsets.only(bottom: v));
      expect(v.pl, const EdgeInsets.only(left: v));
      expect(v.pr, const EdgeInsets.only(right: v));
      expect(v.m, const EdgeInsets.all(v));
      expect(v.mx, const EdgeInsets.symmetric(horizontal: v));
      expect(v.my, const EdgeInsets.symmetric(vertical: v));
      expect(v.mt, const EdgeInsets.only(top: v));
      expect(v.mb, const EdgeInsets.only(bottom: v));
      expect(v.ml, const EdgeInsets.only(left: v));
      expect(v.mr, const EdgeInsets.only(right: v));
    });
  });
}
