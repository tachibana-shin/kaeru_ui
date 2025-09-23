import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('gesture extension', () {
    testWidgets('onTap triggers callback', (tester) async {
      var tapped = false;
      final w = const Text('Tap').onTap(() => tapped = true);
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: w)));
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });
}
