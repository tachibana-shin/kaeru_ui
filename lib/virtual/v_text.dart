import 'package:flutter/material.dart';

import 'package:kaeru_ui/extensions/generic/color.dart';

/// A chainable text builder for Flutter.
class VText {
  /// The text data.
  final String? data;
  final TextStyle _style;
  final TextAlign? _align;
  final int? _maxLines;
  final TextOverflow? _overflow;
  final TextScaler? _textScaler;

  /// The strut style.
  final StrutStyle? strutStyle;

  /// The text direction.
  final TextDirection? textDirection;

  /// The locale.
  final Locale? locale;

  /// Whether the text should wrap.
  final bool? softWrap;

  /// The semantics label.
  final String? semanticsLabel;

  /// The semantics identifier.
  final String? semanticsIdentifier;

  /// The text width basis.
  final TextWidthBasis? textWidthBasis;

  /// The text height behavior.
  final TextHeightBehavior? textHeightBehavior;

  /// The selection color.
  final Color? selectionColor;

  /// Creates a [VText] with optional parameters.
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

  /// Returns a copy with merged [style].
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

  /// Sets the text color.
  VText color(Color c) => copyWithStyle(TextStyle(color: c));

  /// Sets the font size.
  VText size(double s) => copyWithStyle(TextStyle(fontSize: s));

  /// Sets letter spacing.
  VText spacing(double v) => copyWithStyle(TextStyle(letterSpacing: v));

  /// Sets word spacing.
  VText wordSpacing(double v) => copyWithStyle(TextStyle(wordSpacing: v));

  /// Sets font weight.
  VText weight(FontWeight w) => copyWithStyle(TextStyle(fontWeight: w));

  /// Adds a shadow to the text.
  VText shadow({
    Color color = Colors.black26,
    double blur = 2,
    Offset offset = const Offset(1, 1),
  }) => copyWithStyle(
    TextStyle(
      shadows: [Shadow(color: color, blurRadius: blur, offset: offset)],
    ),
  );

  /// Sets background color.
  VText bg(Color c) => copyWithStyle(TextStyle(backgroundColor: c));

  /// Font weight shortcuts
  /// Thin font weight.
  VText get thin => weight(FontWeight.w100);

  /// Light font weight.
  VText get light => weight(FontWeight.w300);

  /// Normal font weight.
  VText get normal => weight(FontWeight.w400);

  /// Medium font weight.
  VText get medium => weight(FontWeight.w500);

  /// Semibold font weight.
  VText get semibold => weight(FontWeight.w600);

  /// Bold font weight.
  VText get bold => weight(FontWeight.bold);

  /// Extra bold font weight.
  VText get extrabold => weight(FontWeight.w800);

  /// Black font weight.
  VText get black => weight(FontWeight.w900);

  /// Italic font style.
  VText get italic =>
      copyWithStyle(const TextStyle(fontStyle: FontStyle.italic));

  /// Underline decoration.
  VText get underline =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.underline));

  /// Line through decoration.
  VText get lineThrough =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.lineThrough));

  /// Overline decoration.
  VText get overline =>
      copyWithStyle(const TextStyle(decoration: TextDecoration.overline));

  /// Sets text alignment.
  VText align(TextAlign a) => VText(
    data,
    style: _style,
    align: a,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );

  /// Center alignment.
  VText get center => align(TextAlign.center);

  /// Right alignment.
  VText get right => align(TextAlign.right);

  /// Left alignment.
  VText get left => align(TextAlign.left);

  /// Justify alignment.
  VText get justify => align(TextAlign.justify);

  /// Sets max lines.
  VText maxLines(int n) => VText(
    data,
    style: _style,
    align: _align,
    maxLines: n,
    overflow: _overflow,
    textScaler: _textScaler,
  );

  /// Clips overflow.
  VText get overflowClip => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.clip,
    textScaler: _textScaler,
  );

  /// Ellipsis overflow.
  VText get overflowEllipsis => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.ellipsis,
    textScaler: _textScaler,
  );

  /// Fade overflow.
  VText get overflowFade => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: TextOverflow.fade,
    textScaler: _textScaler,
  );

  /// Scales the text.
  VText scale(double factor) => VText(
    data,
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: TextScaler.linear(factor),
  );

  /// Transforms text to uppercase.
  VText get uppercase => VText(
    data?.toUpperCase() ?? '',
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );

  /// Transforms text to lowercase.
  VText get lowercase => VText(
    data?.toLowerCase() ?? '',
    style: _style,
    align: _align,
    maxLines: _maxLines,
    overflow: _overflow,
    textScaler: _textScaler,
  );

  /// Capitalizes the first letter.
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

  /// Extra small font size.
  VText get xs => size(12);

  /// Small font size.
  VText get sm => size(14);

  /// Base font size.
  VText get base => size(16);

  /// Large font size.
  VText get lg => size(18);

  /// Extra large font size.
  VText get xl => size(20);

  /// 2x extra large font size.
  VText get xl2 => size(24);

  /// 3x extra large font size.
  VText get xl3 => size(30);

  /// 4x extra large font size.
  VText get xl4 => size(36);

  /// 5x extra large font size.
  VText get xl5 => size(48);

  /// 6x extra large font size.
  VText get xl6 => size(60);

  /// Sets opacity for text color.
  VText opacity(double o) =>
      copyWithStyle(TextStyle(color: (_style.color ?? Colors.black).o(o)));

  /// 25% opacity.
  VText get opacity25 => opacity(0.25);

  /// 50% opacity.
  VText get opacity50 => opacity(0.5);

  /// 75% opacity.
  VText get opacity75 => opacity(0.75);

  /// 100% opacity.
  VText get opacity100 => opacity(1.0);

  /// Tight letter spacing.
  VText get tight => spacing(-0.5);

  /// Wide letter spacing.
  VText get wide => spacing(0.5);

  /// Red color shortcut.
  VText red(int shade) => color(Colors.red[shade]!);

  /// Blue color shortcut.
  VText blue(int shade) => color(Colors.blue[shade]!);

  /// Green color shortcut.
  VText green(int shade) => color(Colors.green[shade]!);

  /// Gray color shortcut.
  VText gray(int shade) => color(Colors.grey[shade]!);

  /// White color shortcut.
  VText get white => color(Colors.white);

  /// Black color shortcut.
  VText get blackColor => color(Colors.black);

  /// Sets line height.
  VText lineHeight(double h) => copyWithStyle(TextStyle(height: h));

  /// Tight line height.
  VText get lhTight => lineHeight(0.8);

  /// Normal line height.
  VText get lhNormal => lineHeight(1.0);

  /// Relaxed line height.
  VText get lhRelaxed => lineHeight(1.5);

  /// Loose line height.
  VText get lhLoose => lineHeight(2.0);

  /// Builds the Flutter [Text] widget.
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

/// material you 2021
extension VTextExt on VText {
  VText get displayLarge {
    return size(57.0).lineHeight(64.0).normal.spacing(-0.25);
  }

  VText get displayMedium {
    return size(45.0).lineHeight(52.0).normal.spacing(0.0);
  }

  VText get displaySmall {
    return size(36.0).lineHeight(44.0).normal.spacing(0.0);
  }

  // Headline
  VText get headlineLarge {
    return size(32.0).lineHeight(40.0).normal.spacing(0.0);
  }

  VText get headlineMedium {
    return size(28.0).lineHeight(36.0).normal.spacing(0.0);
  }

  VText get headlineSmall {
    return size(24.0).lineHeight(32.0).normal.spacing(0.0);
  }

  VText get titleLarge {
    return size(22.0).lineHeight(28.0).normal.spacing(0.0);
  }

  VText get titleMedium {
    return size(16.0).lineHeight(24.0).medium.spacing(0.15);
  }

  VText get titleSmall {
    return size(14.0).lineHeight(20.0).medium.spacing(0.1);
  }

  // Body
  VText get bodyLarge {
    return size(16.0).lineHeight(24.0).normal.spacing(0.5);
  }

  VText get bodyMedium {
    return size(14.0).lineHeight(20.0).normal.spacing(0.25);
  }

  VText get bodySmall {
    return size(12.0).lineHeight(16.0).normal.spacing(0.4);
  }

  // Label
  VText get labelLarge {
    return size(14.0).lineHeight(20.0).medium.spacing(0.1);
  }

  VText get labelMedium {
    return size(12.0).lineHeight(16.0).medium.spacing(0.5);
  }

  VText get labelSmall {
    return size(11.0).lineHeight(16.0).medium.spacing(0.5);
  }
}
