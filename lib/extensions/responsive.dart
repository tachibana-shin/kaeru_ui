/// Responsive helpers and grid system for Kaeru UI.
///
/// Example:
/// ```dart
/// context.isXs; // true if width < 400
/// Text('Mobile view').xsOnly(context);
/// GridRow(xs: 2, md: 4, children: [...]);
/// ```

import 'package:flutter/material.dart';
import 'package:kaeru_ui/extensions/clip.dart';
import 'package:kaeru_ui/extensions/generic/list/wrap.dart';

class Breakpoints {
  static double xs = 400; // extra small
  static double sm = 600; // small devices
  static double md = 1024; // medium devices
  static double lg = 1440; // large devices
}

/// Responsive helpers on BuildContext.
extension KaeruResponsiveHelpers on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  bool get isXs => width < Breakpoints.xs;
  bool get isSm => width >= Breakpoints.xs && width < Breakpoints.sm;
  bool get isMd => width >= Breakpoints.sm && width < Breakpoints.md;
  bool get isLg => width >= Breakpoints.md && width < Breakpoints.lg;
  bool get isXl => width >= Breakpoints.lg;

  /// Shortcuts
  bool get xsOnly => isXs;
  bool get smOnly => isSm;
  bool get mdOnly => isMd;
  bool get lgOnly => isLg;
  bool get xlOnly => isXl;

  bool get xsDown => isXs || isSm;
  bool get smDown => isSm || isMd;
  bool get mdDown => isMd || isLg;
  bool get lgDown => isLg || isXl;

  bool get smUp => isSm || isMd || isLg || isXl;
  bool get mdUp => isMd || isLg || isXl;
  bool get lgUp => isLg || isXl;

  T responsiveValue<T>({required T xs, T? sm, T? md, T? lg, T? xl}) {
    if (isXs) return xs;
    if (isSm) return sm ?? xs;
    if (isMd) return md ?? sm ?? xs;
    if (isLg) return lg ?? md ?? sm ?? xs;
    if (isXl) return xl ?? lg ?? md ?? sm ?? xs;
    return xs; // fallback
  }
}

/// Responsive widget visibility extensions.
/// Example: `Text('Mobile only').xsOnly(context)`
extension KaeruResponsiveWidget on Widget {
  /// Only show on specific breakpoints
  Widget xsOnly(BuildContext context) =>
      context.xsOnly ? this : const SizedBox.shrink();

  Widget smOnly(BuildContext context) =>
      context.smOnly ? this : const SizedBox.shrink();

  Widget mdOnly(BuildContext context) =>
      context.mdOnly ? this : const SizedBox.shrink();

  Widget lgOnly(BuildContext context) =>
      context.lgOnly ? this : const SizedBox.shrink();

  Widget xlOnly(BuildContext context) =>
      context.xlOnly ? this : const SizedBox.shrink();

  /// Chainable visibility: xsDown, smUp, mdDown...
  Widget xsDown(BuildContext context) =>
      context.xsDown ? this : const SizedBox.shrink();

  Widget smDown(BuildContext context) =>
      context.smDown ? this : const SizedBox.shrink();

  Widget mdDown(BuildContext context) =>
      context.mdDown ? this : const SizedBox.shrink();

  Widget smUp(BuildContext context) =>
      context.smUp ? this : const SizedBox.shrink();

  Widget mdUp(BuildContext context) =>
      context.mdUp ? this : const SizedBox.shrink();

  Widget lgUp(BuildContext context) =>
      context.lgUp ? this : const SizedBox.shrink();
}

/// Responsive grid row for Kaeru UI.
/// Example:
/// ```dart
/// GridRow(xs: 2, md: 4, children: [...])
/// ```
class GridRow extends StatelessWidget {
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  const GridRow({
    super.key,
    this.xs = 1,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    required this.children,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  int _getColumnCount(BuildContext context) {
    final width = context.width;
    if (width < Breakpoints.xs) return xs;
    if (width < Breakpoints.sm) return sm ?? xs;
    if (width < Breakpoints.md) return md ?? sm ?? xs;
    if (width < Breakpoints.lg) return lg ?? md ?? sm ?? xs;
    return xl ?? lg ?? md ?? sm ?? xs;
  }

  @override
  Widget build(BuildContext context) {
    final colCount = _getColumnCount(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: children.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colCount,
            crossAxisSpacing: spacing,
            mainAxisSpacing: runSpacing,
          ),
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

/// Responsive flex column for Kaeru UI.
/// Example:
/// ```dart
/// FlexCol(xs: 12, md: 6, child: Container())
/// ```
class FlexCol extends StatelessWidget {
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final Widget child;

  static const int totalColumns = 12;

  const FlexCol({
    super.key,
    this.xs = 12,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    required this.child,
  });

  int _getColSpan(BuildContext context) {
    final width = context.width;
    if (width < Breakpoints.xs) return xs;
    if (width < Breakpoints.sm) return sm ?? xs;
    if (width < Breakpoints.md) return md ?? sm ?? xs;
    if (width < Breakpoints.lg) return lg ?? md ?? sm ?? xs;
    return xl ?? lg ?? md ?? sm ?? xs;
  }

  @override
  Widget build(BuildContext context) {
    final span = _getColSpan(context).clamp(1, totalColumns);
    final colWidth = context.width / totalColumns * span;

    return child.width(colWidth);
  }
}

/// Responsive flex row for Kaeru UI.
/// Example:
/// ```dart
/// FlexRow(children: [FlexCol(...), FlexCol(...)])
/// ```
class FlexRow extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const FlexRow({
    super.key,
    required this.children,
    this.spacing = 8,
    this.runSpacing = 8,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return children.wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: _mapMainAxisAlignment(mainAxisAlignment),
    );
  }

  WrapAlignment _mapMainAxisAlignment(MainAxisAlignment alignment) {
    switch (alignment) {
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
      case MainAxisAlignment.start:
        return WrapAlignment.start;
    }
  }
}

/// Extension to convert List<FlexCol> to FlexRow.
extension KaeruFlexListColExt on List<FlexCol> {
  FlexRow toFlex({
    Key? key,
    double spacing = 8,
    double runSpacing = 8,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) => FlexRow(
    key: key,
    spacing: spacing,
    runSpacing: runSpacing,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: mainAxisAlignment,
    children: this,
  );
}

/// Extension to convert List<Widget> to FlexRow with columns.
extension KaeruFlexListExt on List<Widget> {
  List<FlexCol> toFlexCol({
    Key? key,
    int xs = 12,
    int? sm,
    int? md,
    int? lg,
    int? xl,
  }) => map(
    (child) =>
        FlexCol(key: key, xs: xs, sm: sm, md: md, lg: lg, xl: xl, child: child),
  ).toList();

  FlexRow toFlex({
    int xs = 12,
    int? sm,
    int? md,
    int? lg,
    int? xl,

    double spacing = 8,
    double runSpacing = 8,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) => toFlexCol(xs: xs, sm: sm, md: md, lg: lg, xl: xl).toFlex(
    spacing: spacing,
    runSpacing: runSpacing,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: mainAxisAlignment,
  );
}
