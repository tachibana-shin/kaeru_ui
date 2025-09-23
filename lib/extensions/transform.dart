import 'package:flutter/material.dart';

extension KaeruWidgetTransform on Widget {
  Widget rotate(double radians) =>
      Transform.rotate(angle: radians, child: this);

  Widget get flipX => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..scaleByDouble(-1.0, 1.0, 1.0, 1.0),
    child: this,
  );

  Widget get flipY => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..scaleByDouble(1.0, -1.0, 1.0, 1.0),
    child: this,
  );

  Widget translate({double dx = 0, double dy = 0}) =>
      Transform.translate(offset: Offset(dx, dy), child: this);
}
