import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('responsive extensions', () {
    testWidgets('BuildContext flags and widget visibility helpers', (
      tester,
    ) async {
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(500, 800)),
            child: Container(key: key),
          ),
        ),
      );

      final ctx = key.currentContext!;
      // width = 500 -> xs=false, smOnly=true
      expect(ctx.isXs, isFalse);
      expect(ctx.isSm, isTrue);
      expect(ctx.smOnly, isTrue);
      expect(ctx.mdOnly || ctx.lgOnly || ctx.xlOnly, isFalse);

      final visible = const Text('A').smOnly(ctx);
      final hidden = const Text('A').mdOnly(ctx);
      expect(visible, isA<Text>());
      expect(hidden, isA<SizedBox>());
    });
  });
}
