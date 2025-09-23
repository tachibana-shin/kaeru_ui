import 'package:flutter/material.dart';

class Breakpoints {
  static double xs = 400; // extra small
  static double sm = 600; // small devices
  static double md = 1024; // medium devices
  static double lg = 1440; // large devices
}

extension KaeruResponsiveHelpers on BuildContext {
  double get width => MediaQuery.of(this).size.width;

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
}

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
