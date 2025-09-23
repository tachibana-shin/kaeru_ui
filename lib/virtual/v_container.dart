import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/generic/num.dart';

class VContainer {
  final Widget? child;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? _width;
  final double? _height;
  final BoxDecoration? decoration;

  const VContainer({
    this.child,
    this.alignment,
    this.padding,
    this.margin,
    double? width,
    double? height,
    this.decoration,
  }) : _height = height,
       _width = width;

  // ===== Chainable Methods =====
  VContainer childWidget(Widget child) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  VContainer rounded([double radius = 8]) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(borderRadius: BorderRadius.circular(radius))) ??
        BoxDecoration(borderRadius: BorderRadius.circular(radius)),
  );

  VContainer bg(Color color) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(color: color)) ?? BoxDecoration(color: color),
  );

  VContainer shadow({
    Color color = Colors.black26,
    double blur = 4,
    Offset offset = const Offset(2, 2),
    double spread = 0,
  }) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: blur,
              offset: offset,
              spreadRadius: spread,
            ),
          ],
        )) ??
        BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: blur,
              offset: offset,
              spreadRadius: spread,
            ),
          ],
        ),
  );

  // ===== Size & Alignment =====
  VContainer width(double w) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: w,
    height: _height,
    decoration: decoration,
  );

  VContainer height(double h) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: h,
    decoration: decoration,
  );

  VContainer size(double w, double h) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: w,
    height: h,
    decoration: decoration,
  );

  VContainer align(Alignment a) => VContainer(
    child: child,
    alignment: a,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  VContainer get alignCenter => align(Alignment.center);
  VContainer get alignTopLeft => align(Alignment.topLeft);
  VContainer get alignTopRight => align(Alignment.topRight);
  VContainer get alignBottomLeft => align(Alignment.bottomLeft);
  VContainer get alignBottomRight => align(Alignment.bottomRight);

  // ===== Margin & Padding =====
  VContainer m(double v) => _copyWithMargin(v.p);
  VContainer mx(double v) => _copyWithMargin(v.px);
  VContainer my(double v) => _copyWithMargin(v.py);
  VContainer mt(double v) => _copyWithMargin(v.pt);
  VContainer mb(double v) => _copyWithMargin(v.pb);
  VContainer ml(double v) => _copyWithMargin(v.pl);
  VContainer mr(double v) => _copyWithMargin(v.pr);

  VContainer p(double v) => _copyWithPadding(v.p);
  VContainer px(double v) => _copyWithPadding(v.px);
  VContainer py(double v) => _copyWithPadding(v.py);
  VContainer pt(double v) => _copyWithPadding(v.pt);
  VContainer pb(double v) => _copyWithPadding(v.pb);
  VContainer pl(double v) => _copyWithPadding(v.pl);
  VContainer pr(double v) => _copyWithPadding(v.pr);

  VContainer _copyWithPadding(EdgeInsetsGeometry p) => VContainer(
    child: child,
    alignment: alignment,
    padding: p,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  VContainer _copyWithMargin(EdgeInsetsGeometry m) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: m,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  // ===== Background Gradient =====
  VContainer linearGradientBg({
    required List<Color> colors,
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(
          gradient: LinearGradient(colors: colors, begin: begin, end: end),
        )) ??
        BoxDecoration(
          gradient: LinearGradient(colors: colors, begin: begin, end: end),
        ),
  );

  VContainer radialGradientBg({
    required List<Color> colors,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
  }) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(
          gradient: RadialGradient(
            colors: colors,
            center: center,
            radius: radius,
          ),
        )) ??
        BoxDecoration(
          gradient: RadialGradient(
            colors: colors,
            center: center,
            radius: radius,
          ),
        ),
  );

  // ===== Border =====
  VContainer border({Color color = Colors.black, double width = 1}) =>
      VContainer(
        child: child,
        alignment: alignment,
        padding: padding,
        margin: margin,
        width: _width,
        height: _height,
        decoration:
            (decoration?.copyWith(
              border: Border.all(color: color, width: width),
            )) ??
            BoxDecoration(
              border: Border.all(color: color, width: width),
            ),
      );

  // ===== Shape Shortcuts =====
  VContainer circle() => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration:
        (decoration?.copyWith(shape: BoxShape.circle)) ??
        const BoxDecoration(shape: BoxShape.circle),
  );

  // ===== Opacity =====
  VContainer opacity(double value) => VContainer(
    child: Opacity(opacity: value, child: child),
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  Container make() => Container(
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
    child: child,
  );
}
