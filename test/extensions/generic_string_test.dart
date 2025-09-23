import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

void main() {
  group('generic: string', () {
    test('cases and parsing', () {
      expect('hello'.capitalize, 'Hello');
      expect('hello world'.titleCase, 'Hello World');
      expect('hello_world case'.camelCase, 'helloWorldCase');
      expect('Hello World__X'.snakeCase, 'hello_world_x');
      expect('42'.toInt, 42);
      expect('3.14'.toDouble, 3.14);
    });

    test('isEmail and .text builder', () {
      expect('a@b.com'.isEmail, isTrue);
      expect('not-an-email'.isEmail, isFalse);
      final v = 'Hi'.text;
      expect(v.make(), isA<Text>());
      expect(v.make().data, 'Hi');
    });

    test('string.avatar returns CircleAvatar', () {
      final w = 'https://example.com/a.png'.avatar(radius: 12);
      expect(w, isA<CircleAvatar>());
      final avatar = w as CircleAvatar;
      expect(avatar.radius, 12);
    });
  });
}
