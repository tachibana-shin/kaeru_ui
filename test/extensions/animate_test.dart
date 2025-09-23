import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('animate extension', () {
    testWidgets('fadeIn wraps with FadeTransition', (tester) async {
      final w = const Text('A').fadeIn();
      final key = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: KeyedSubtree(key: key, child: w))),
      );
      expect(
        find.descendant(of: find.byKey(key), matching: find.byType(FadeTransition)),
        findsOneWidget,
      );
    });

    testWidgets('slideUp wraps with SlideTransition', (tester) async {
      final w = const Text('A').slideUp();
      final key = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: KeyedSubtree(key: key, child: w))),
      );
      expect(
        find.descendant(of: find.byKey(key), matching: find.byType(SlideTransition)),
        findsOneWidget,
      );
    });

    testWidgets('scale wraps with ScaleTransition', (tester) async {
      final w = const Text('A').scale();
      final key = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: KeyedSubtree(key: key, child: w))),
      );
      expect(
        find.descendant(of: find.byKey(key), matching: find.byType(ScaleTransition)),
        findsOneWidget,
      );
    });

    testWidgets('rotate wraps with RotationTransition', (tester) async {
      final w = KaeruAnimation(const Text('A')).rotate();
      final key = UniqueKey();
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: KeyedSubtree(key: key, child: w))),
      );
      expect(
        find.descendant(of: find.byKey(key), matching: find.byType(RotationTransition)),
        findsOneWidget,
      );
    });
  });
}
