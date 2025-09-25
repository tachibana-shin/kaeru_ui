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

/// Breakpoints for responsive design.
class Breakpoints {
  /// Extra small breakpoint.
  static double xs = 400; // extra small
  /// Small breakpoint.
  static double sm = 600; // small devices
  /// Medium breakpoint.
  static double md = 1024; // medium devices
  /// Large breakpoint.
  static double lg = 1440; // large devices
}

/// Responsive helpers on BuildContext.
extension KaeruResponsiveHelpers on BuildContext {
  /// The width of the screen.
  double get width => MediaQuery.of(this).size.width;
  /// The height of the screen.
  double get height => MediaQuery.of(this).size.height;

  /// Whether the screen width is extra small.
  bool get isXs => width < Breakpoints.xs;
  /// Whether the screen width is small.
  bool get isSm => width >= Breakpoints.xs && width < Breakpoints.sm;
  /// Whether the screen width is medium.
  bool get isMd => width >= Breakpoints.sm && width < Breakpoints.md;
  /// Whether the screen width is large.
  bool get isLg => width >= Breakpoints.md && width < Breakpoints.lg;
  /// Whether the screen width is extra large.
  bool get isXl => width >= Breakpoints.lg;

  /// Shortcuts
  /// Whether the screen width is extra small.
  bool get xsOnly => isXs;
  /// Whether the screen width is small.
  bool get smOnly => isSm;
  /// Whether the screen width is medium.
  bool get mdOnly => isMd;
  /// Whether the screen width is large.
  bool get lgOnly => isLg;
  /// Whether the screen width is extra large.
  bool get xlOnly => isXl;

  /// Whether the screen width is extra small or small.
  bool get xsDown => isXs || isSm;
  /// Whether the screen width is small or medium.
  bool get smDown => isSm || isMd;
  /// Whether the screen width is medium or large.
  bool get mdDown => isMd || isLg;
  /// Whether the screen width is large or extra large.
  bool get lgDown => isLg || isXl;

  /// Whether the screen width is small or larger.
  bool get smUp => isSm || isMd || isLg || isXl;
  /// Whether the screen width is medium or larger.
  bool get mdUp => isMd || isLg || isXl;
  /// Whether the screen width is large or larger.
  bool get lgUp => isLg || isXl;

  /// Returns a value based on the current breakpoint.
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
  /// Shows the widget only on extra small screens.
  Widget xsOnly(BuildContext context) =>
      context.xsOnly ? this : const SizedBox.shrink();

  /// Shows the widget only on small screens.
  Widget smOnly(BuildContext context) =>
      context.smOnly ? this : const SizedBox.shrink();

  /// Shows the widget only on medium screens.
  Widget mdOnly(BuildContext context) =>
      context.mdOnly ? this : const SizedBox.shrink();

  /// Shows the widget only on large screens.
  Widget lgOnly(BuildContext context) =>
      context.lgOnly ? this : const SizedBox.shrink();

  /// Shows the widget only on extra large screens.
  Widget xlOnly(BuildContext context) =>
      context.xlOnly ? this : const SizedBox.shrink();

  /// Chainable visibility: xsDown, smUp, mdDown...
  /// Shows the widget on extra small and small screens.
  Widget xsDown(BuildContext context) =>
      context.xsDown ? this : const SizedBox.shrink();

  /// Shows the widget on small and medium screens.
  Widget smDown(BuildContext context) =>
      context.smDown ? this : const SizedBox.shrink();

  /// Shows the widget on medium and large screens.
  Widget mdDown(BuildContext context) =>
      context.mdDown ? this : const SizedBox.shrink();

  /// Shows the widget on small screens and up.
  Widget smUp(BuildContext context) =>
      context.smUp ? this : const SizedBox.shrink();

  /// Shows the widget on medium screens and up.
  Widget mdUp(BuildContext context) =>
      context.mdUp ? this : const SizedBox.shrink();

  /// Shows the widget on large screens and up.
  Widget lgUp(BuildContext context) =>
      context.lgUp ? this : const SizedBox.shrink();
}

/// Responsive grid row for Kaeru UI.
/// Example:
/// ```dart
/// GridRow(xs: 2, md: 4, children: [...])
/// ```
class GridRow extends StatelessWidget {
  /// The number of columns for extra small screens.
  final int xs;
  /// The number of columns for small screens.
  final int? sm;
  /// The number of columns for medium screens.
  final int? md;
  /// The number of columns for large screens.
  final int? lg;
  /// The number of columns for extra large screens.
  final int? xl;
  /// The children of the grid row.
  final List<Widget> children;
  /// The spacing between columns.
  final double spacing;
  /// The spacing between rows.
  final double runSpacing;

  /// Creates a [GridRow].
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
  /// The number of columns for extra small screens.
  final int xs;
  /// The number of columns for small screens.
  final int? sm;
  /// The number of columns for medium screens.
  final int? md;
  /// The number of columns for large screens.
  final int? lg;
  /// The number of columns for extra large screens.
  final int? xl;
  /// The child of the flex column.
  final Widget child;

  /// The total number of columns.
  static const int totalColumns = 12;

  /// Creates a [FlexCol].
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
  /// The children of the flex row.
  final List<Widget> children;
  /// The spacing between columns.
  final double spacing;
  /// The spacing between rows.
  final double runSpacing;
  /// The cross axis alignment of the flex row.
  final CrossAxisAlignment crossAxisAlignment;
  /// The main axis alignment of the flex row.
  final MainAxisAlignment mainAxisAlignment;

  /// Creates a [FlexRow].
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
  /// Converts a list of [FlexCol] to a [FlexRow].
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
  /// Converts a list of widgets to a list of [FlexCol].
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

  /// Converts a list of widgets to a [FlexRow].
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