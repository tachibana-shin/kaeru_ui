import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('KaeruFlexGapExtension.hStackWithGap', () {
    test('returns Row with original children when gap = 0', () {
      final children = <Widget>[
        const Text('A'),
        const Text('B'),
        const Text('C'),
      ];

      final row = children.hStackWithGap(gap: 0) as Row;
      expect(row, isA<Row>());
      expect(row.children.length, 3);
      expect(row.children[0], isA<Text>());
      expect(row.children[1], isA<Text>());
      expect(row.children[2], isA<Text>());
    });

    test('inserts SizedBox(width: gap) between children when gap > 0', () {
      final children = <Widget>[
        const Text('A'),
        const Text('B'),
        const Text('C'),
      ];

      const gap = 8.0;
      final row = children.hStackWithGap(gap: gap) as Row;

      // Expect pattern: A, SizedBox(gap), B, SizedBox(gap), C
      expect(row.children.length, 5);
      expect(row.children[0], isA<Text>());
      expect(row.children[1], isA<SizedBox>());
      expect((row.children[1] as SizedBox).width, gap);
      expect(row.children[2], isA<Text>());
      expect(row.children[3], isA<SizedBox>());
      expect((row.children[3] as SizedBox).width, gap);
      expect(row.children[4], isA<Text>());
    });

    test('respects alignment parameters', () {
      final children = <Widget>[const Text('A'), const Text('B')];

      final row =
          children.hStackWithGap(
                gap: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
              )
              as Row;

      expect(row.mainAxisAlignment, MainAxisAlignment.spaceBetween);
      expect(row.crossAxisAlignment, CrossAxisAlignment.end);
      expect(row.mainAxisSize, MainAxisSize.min);
    });
  });

  group('KaeruFlexGapExtension.vStackWithGap', () {
    test('returns Column with original children when gap = 0', () {
      final children = <Widget>[const Text('A'), const Text('B')];

      final column = children.vStackWithGap(gap: 0) as Column;
      expect(column, isA<Column>());
      expect(column.children.length, 2);
      expect(column.children[0], isA<Text>());
      expect(column.children[1], isA<Text>());
    });

    test('inserts SizedBox(height: gap) between children when gap > 0', () {
      final children = <Widget>[
        const Text('A'),
        const Text('B'),
        const Text('C'),
      ];

      const gap = 12.0;
      final column = children.vStackWithGap(gap: gap) as Column;

      // Expect pattern: A, SizedBox(gap), B, SizedBox(gap), C
      expect(column.children.length, 5);
      expect(column.children[0], isA<Text>());
      expect(column.children[1], isA<SizedBox>());
      expect((column.children[1] as SizedBox).height, gap);
      expect(column.children[2], isA<Text>());
      expect(column.children[3], isA<SizedBox>());
      expect((column.children[3] as SizedBox).height, gap);
      expect(column.children[4], isA<Text>());
    });

    test('respects alignment parameters', () {
      final children = <Widget>[const Text('A'), const Text('B')];

      final column =
          children.vStackWithGap(
                gap: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              )
              as Column;

      expect(column.mainAxisAlignment, MainAxisAlignment.center);
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);
      expect(column.mainAxisSize, MainAxisSize.min);
    });
  });
}
