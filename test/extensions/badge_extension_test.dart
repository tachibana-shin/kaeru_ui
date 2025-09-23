import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('badge extension', () {
    testWidgets('badge wraps child with Container and DefaultTextStyle', (
      tester,
    ) async {
      final w = const Text('9').badge();
      final key = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: KeyedSubtree(key: key, child: w),
          ),
        ),
      );
      expect(
        find.descendant(of: find.byKey(key), matching: find.byType(Container)),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byKey(key),
          matching: find.byType(DefaultTextStyle),
        ),
        findsOneWidget,
      );
    });
  });
}
