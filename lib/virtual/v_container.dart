import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

/// A chainable container builder for Flutter widgets.
class VContainer {
  /// The child widget.
  final Widget? child;

  /// The alignment of the container.
  final Alignment? alignment;

  /// The padding inside the container.
  final EdgeInsetsGeometry? padding;

  /// The margin outside the container.
  final EdgeInsetsGeometry? margin;
  final double? _width;
  final double? _height;

  /// The decoration of the container.
  final BoxDecoration? decoration;

  /// Creates a [VContainer] with optional parameters.
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

  /// Sets the child widget.
  VContainer childWidget(Widget child) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  /// Applies rounded corners with [radius].
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

  /// Sets the background color.
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

  /// Adds a box shadow to the container.
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

  /// Sets the width of the container.
  VContainer width(double w) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: w,
    height: _height,
    decoration: decoration,
  );

  /// Sets the height of the container.
  VContainer height(double h) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: h,
    decoration: decoration,
  );

  /// Sets both width and height of the container.
  VContainer size(double w, double h) => VContainer(
    child: child,
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: w,
    height: h,
    decoration: decoration,
  );

  /// Sets the alignment of the container.
  VContainer align(Alignment a) => VContainer(
    child: child,
    alignment: a,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  /// Aligns the container to the center.
  VContainer get alignCenter => align(Alignment.center);

  /// Aligns the container to the top left.
  VContainer get alignTopLeft => align(Alignment.topLeft);

  /// Aligns the container to the top right.
  VContainer get alignTopRight => align(Alignment.topRight);

  /// Aligns the container to the bottom left.
  VContainer get alignBottomLeft => align(Alignment.bottomLeft);

  /// Aligns the container to the bottom right.
  VContainer get alignBottomRight => align(Alignment.bottomRight);

  // ===== Margin & Padding =====

  /// Sets the margin.
  VContainer mar(EdgeInsetsGeometry p) => _copyWithMargin(p);

  /// Sets all margins ([v]) or horizontal ([v]) and vertical ([y]) margins.
  VContainer m(double v, [double? y]) =>
      _copyWithMargin(y == null ? v.p : v.px.merge(y.py));

  /// Sets horizontal margin.
  VContainer mx(double v) => _copyWithMargin(v.px);

  /// Sets vertical margin.
  VContainer my(double v) => _copyWithMargin(v.py);

  /// Sets top margin.
  VContainer mt(double v) => _copyWithMargin(v.pt);

  /// Sets bottom margin.
  VContainer mb(double v) => _copyWithMargin(v.pb);

  /// Sets left margin.
  VContainer ml(double v) => _copyWithMargin(v.pl);

  /// Sets right margin.
  VContainer mr(double v) => _copyWithMargin(v.pr);

  /// Sets the padding.
  VContainer pad(EdgeInsetsGeometry p) => _copyWithPadding(p);

  /// Sets all paddings ([v]) or horizontal ([v]) and vertical ([y]) paddings.
  VContainer p(double v, [double? y]) =>
      _copyWithPadding(y == null ? v.p : v.px.merge(y.py));

  /// Sets horizontal padding.
  VContainer px(double v) => _copyWithPadding(v.px);

  /// Sets vertical padding.
  VContainer py(double v) => _copyWithPadding(v.py);

  /// Sets top padding.
  VContainer pt(double v) => _copyWithPadding(v.pt);

  /// Sets bottom padding.
  VContainer pb(double v) => _copyWithPadding(v.pb);

  /// Sets left padding.
  VContainer pl(double v) => _copyWithPadding(v.pl);

  /// Sets right padding.
  VContainer pr(double v) => _copyWithPadding(v.pr);

  /// Internal: returns a copy with new padding.
  VContainer _copyWithPadding(EdgeInsetsGeometry p) => VContainer(
    child: child,
    alignment: alignment,
    padding: p,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  /// Internal: returns a copy with new margin.
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

  /// Sets a linear gradient background.
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

  /// Sets a radial gradient background.
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

  /// Adds a border to the container.
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

  /// Makes the container a circle.
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

  /// Sets the opacity of the container's child.
  VContainer opacity(double value) => VContainer(
    child: Opacity(opacity: value, child: child),
    alignment: alignment,
    padding: padding,
    margin: margin,
    width: _width,
    height: _height,
    decoration: decoration,
  );

  /// Builds the Flutter [Container] widget.
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
