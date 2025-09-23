import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('KaeruBoxExtension + VContainer.make()', () {
    testWidgets('box + rounded/bg/size/make results in Container with properties', (tester) async {
      final out = const Text('A')
          .box
          .rounded(12)
          .bg(Colors.red)
          .size(80, 40)
          .alignCenter
          .make();

      await tester.pumpWidget(MaterialApp(home: Center(child: out)));

      // Measure the rendered Container size
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);
      final size = tester.getSize(containerFinder);
      expect(size.width, 80);
      expect(size.height, 40);

      final c = tester.widget<Container>(containerFinder);
      expect(c.alignment, Alignment.center);

      final deco = c.decoration as BoxDecoration?;
      expect(deco, isNotNull);
      expect(deco!.color, Colors.red);
      expect(deco.borderRadius, BorderRadius.circular(12));
    });
  });
}
