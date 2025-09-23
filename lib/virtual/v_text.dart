import 'package:flutter/material.dart';

import 'package:kaeru_ui/extensions/generic/color.dart';

class VText {
  final String? data;
  final TextStyle _style;
  final TextAlign? _align;
  final int? _maxLines;
  final TextOverflow? _overflow;
  final TextScaler? _textScaler;

  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

  const VText(
    this.data, {
    TextStyle? style,
    TextAlign? align,
    int? maxLines,
    TextOverflow? overflow,
    TextScaler? textScaler,
    this.strutStyle,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : _style = style ?? const TextStyle(),
       _align = align,
       _maxLines = maxLines,
       _overflow = overflow,
       _textScaler = textScaler;

  // ===== Chainable style methods =====
  VText copyWithStyle(TextStyle style) => VText(
    data,
    style: _style.merge(style),
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
    strutStyle: strutStyle,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    semanticsLabel: semanticsLabel,
    semanticsIdentifier: semanticsIdentifier,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
  );

  VText color(Color c) => copyWithStyle(TextStyle(color: c));
  VText size(double s) => copyWithStyle(TextStyle(fontSize: s));
  VText spacing(double v) => copyWithStyle(TextStyle(letterSpacing: v));
  VText wordSpacing(double v) => copyWithStyle(TextStyle(wordSpacing: v));
  VText weight(FontWeight w) => copyWithStyle(TextStyle(fontWeight: w));
  VText shadow({
    Color color = Colors.black26,
    double blur = 2,
    Offset offset = const Offset(1, 1),
  }) => copyWithStyle(
    TextStyle(
      shadows: [Shadow(color: color, blurRadius: blur, offset: offset)],
    ),
  );
  VText backgroundColor(Color c) =>
      copyWithStyle(TextStyle(backgroundColor: c));

  // Font weight shortcuts
  VText get thin => weight(FontWeight.w100);
  VText get light => weight(FontWeight.w300);
  VText get normal => weight(FontWeight.w400);
  VText get medium => weight(FontWeight.w500);
  VText get semibold => weight(FontWeight.w600);
  VText get bold => weight(FontWeight.bold);
  VText get extrabold => weight(FontWeight.w800);
  VText get black => weight(FontWeight.w900);

  // Font style
  VText get italic =>
      copyWithStyle(const TextStyle(fontStyle: FontStyle.italic));

  // Decorations
  VText get underline =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.underline));
  VText get lineThrough =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.lineThrough));
  VText get overline =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.overline));

  // Layout
  VText align(TextAlign a) => VText(
    data,
    style: _style,
    align: a,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );
  VText get center => align(TextAlign.center);
  VText get right => align(TextAlign.right);
  VText get left => align(TextAlign.left);
  VText get justify => align(TextAlign.justify);

  VText maxLines(int n) => VText(
    data,
    style: _style,
    align: _align,
    maxLines: n,
    overflow: _overflow,
    textScaler: _textScaler,
  );
  VText get overflowClip => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.clip,
    textScaler: _textScaler,
  );
  VText get overflowEllipsis => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.ellipsis,
    textScaler: _textScaler,
  );
  VText get overflowFade => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.fade,
    textScaler: _textScaler,
  );

  VText scale(double factor) => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: TextScaler.linear(factor),
  );

  // Text transform
  VText get uppercase => VText(
    data?.toUpperCase() ?? '',
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );
  VText get lowercase => VText(
    data?.toLowerCase() ?? '',
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );
  VText get capitalize {
    if (data == null || data!.isEmpty) return this;
    final str = data!;
    final cap = str[0].toUpperCase() + str.substring(1);
    return VText(
      cap,
      style: _style,
      align: _align,
      maxLines: _maxLines,
      overflow: _overflow,
      textScaler: _textScaler,
    );
  }

  // Size aliases
  VText get xs => size(12);
  VText get sm => size(14);
  VText get base => size(16);
  VText get lg => size(18);
  VText get xl => size(20);
  VText get xl2 => size(24);
  VText get xl3 => size(30);
  VText get xl4 => size(36);
  VText get xl5 => size(48);
  VText get xl6 => size(60);

  // Opacity
  VText opacity(double o) =>
      copyWithStyle(TextStyle(color: (_style.color ?? Colors.black).o(o)));
  VText get opacity25 => opacity(0.25);
  VText get opacity50 => opacity(0.5);
  VText get opacity75 => opacity(0.75);
  VText get opacity100 => opacity(1.0);

  // Letter spacing shorthands
  VText get tight => spacing(-0.5);
  VText get wide => spacing(0.5);

  // Color shortcuts
  VText red(int shade) => color(Colors.red[shade]!);
  VText blue(int shade) => color(Colors.blue[shade]!);
  VText green(int shade) => color(Colors.green[shade]!);
  VText gray(int shade) => color(Colors.grey[shade]!);

  VText get white => color(Colors.white);
  VText get blackColor => color(Colors.black);

  // ===== Line height =====
  VText lineHeight(double h) => copyWithStyle(TextStyle(height: h));
  VText get lhTight => lineHeight(0.8);
  VText get lhNormal => lineHeight(1.0);
  VText get lhRelaxed => lineHeight(1.5);
  VText get lhLoose => lineHeight(2.0);

  Text make() => Text(
    data ?? '',
    style: _style,
    textAlign: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
    strutStyle: strutStyle,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    semanticsLabel: semanticsLabel,
    semanticsIdentifier: semanticsIdentifier,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
  );
}
