import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('list helpers: flex & wrap', () {
    test('hStack/row and vStack/column build with children and alignments', () {
      final items = const [Text('A'), Text('B')];

      final row =
          items.hStack(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
              )
              as Row;
      expect(row.mainAxisAlignment, MainAxisAlignment.spaceAround);
      expect(row.crossAxisAlignment, CrossAxisAlignment.end);
      expect(row.mainAxisSize, MainAxisSize.min);
      expect(row.children.length, 2);

      final rowAlias = items.row() as Row;
      expect(rowAlias.children.length, 2);

      final col =
          items.vStack(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              )
              as Column;
      expect(col.mainAxisAlignment, MainAxisAlignment.center);
      expect(col.crossAxisAlignment, CrossAxisAlignment.start);
      expect(col.mainAxisSize, MainAxisSize.min);
      expect(col.children.length, 2);

      final colAlias = items.column() as Column;
      expect(colAlias.children.length, 2);
    });

    test('wrap returns Wrap with params', () {
      final items = const [Text('A'), Text('B')];
      final w =
          items.wrap(
                spacing: 4,
                runSpacing: 6,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                verticalDirection: VerticalDirection.up,
              )
              as Wrap;

      expect(w.spacing, 4);
      expect(w.runSpacing, 6);
      expect(w.alignment, WrapAlignment.center);
      expect(w.runAlignment, WrapAlignment.end);
      expect(w.crossAxisAlignment, WrapCrossAlignment.center);
      expect(w.verticalDirection, VerticalDirection.up);
      expect(w.children.length, 2);
    });
  });
}
