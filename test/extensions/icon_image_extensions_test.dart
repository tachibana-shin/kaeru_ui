import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('icon & image extensions', () {
    test('icon size and color', () {
      final ic = KaeruIconExtension(
        const Icon(Icons.add),
      ).size(30).iconColor(Colors.green);
      expect(ic.size, 30);
      expect(ic.color, Colors.green);
    });

    test('image size and fit', () {
      final base = Image.network('https://example.com/a.png');
      final sized = base.size(width: 120, height: 80) as Image;
      expect(sized.width, 120);
      expect(sized.height, 80);

      final fitted = base.fitBox(BoxFit.cover);
      expect(fitted.fit, BoxFit.cover);
    });
  });
}
