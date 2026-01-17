import 'package:flutter/material.dart';

extension PreferredSizeExtension on Widget {
  PreferredSize preferredSize({Key? key, double? height, double? width}) =>
      PreferredSize(
        key: key,
        preferredSize: Size(
          width ?? double.infinity,
          height ?? double.infinity,
        ),
        child: this,
      );
}
