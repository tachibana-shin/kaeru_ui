import 'package:flutter/material.dart';

/// A chainable rich text builder for Flutter.
class VRichText {
  /// The list of inline spans.
  final List<InlineSpan> _children;
  final TextAlign? _align;
  final TextDirection? _textDirection;
  final TextOverflow? _overflow;
  final int? _maxLines;
  final TextHeightBehavior? _textHeightBehavior;

  /// Creates a [VRichText] with optional parameters.
  const VRichText(
    this._children, {
    TextAlign? align,
    TextDirection? textDirection,
    TextOverflow? overflow,
    int? maxLines,
    TextHeightBehavior? textHeightBehavior,
  }) : _align = align,
       _textDirection = textDirection,
       _overflow = overflow,
       _maxLines = maxLines,
       _textHeightBehavior = textHeightBehavior;

  // ===== Chainable TextSpan helpers =====

  /// Applies bold style to all spans.
  VRichText get bold => _applyStyleToAll(
    (old) => old.merge(const TextStyle(fontWeight: FontWeight.bold)),
  );

  /// Applies italic style to all spans.
  VRichText get italic => _applyStyleToAll(
    (old) => old.merge(const TextStyle(fontStyle: FontStyle.italic)),
  );

  /// Sets color for all spans.
  VRichText color(Color c) =>
      _applyStyleToAll((old) => old.merge(TextStyle(color: c)));

  /// Sets font size for all spans.
  VRichText size(double s) =>
      _applyStyleToAll((old) => old.merge(TextStyle(fontSize: s)));

  /// Sets letter spacing for all spans.
  VRichText spacing(double v) =>
      _applyStyleToAll((old) => old.merge(TextStyle(letterSpacing: v)));

  /// Underline decoration for all spans.
  VRichText get underline => _applyStyleToAll(
    (old) => old.merge(const TextStyle(decoration: TextDecoration.underline)),
  );

  /// Line through decoration for all spans.
  VRichText get lineThrough => _applyStyleToAll(
    (old) => old.merge(const TextStyle(decoration: TextDecoration.lineThrough)),
  );

  /// Internal: applies a style transform to all spans.
  VRichText _applyStyleToAll(TextStyle Function(TextStyle) transform) {
    final newChildren = _children.map((span) {
      if (span is TextSpan) {
        final newStyle = transform(span.style ?? const TextStyle());
        return TextSpan(
          text: span.text,
          style: newStyle,
          children: span.children,
        );
      }
      return span;
    }).toList();

    return VRichText(
      newChildren,
      align: _align,
      textDirection: _textDirection,
      overflow: _overflow,
      maxLines: _maxLines,
      textHeightBehavior: _textHeightBehavior,
    );
  }

  // ===== Layout chainable =====

  /// Sets text alignment.
  VRichText align(TextAlign a) => VRichText(
    _children,
    align: a,
    textDirection: _textDirection,
    overflow: _overflow,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  /// Sets text direction.
  VRichText textDirection(TextDirection dir) => VRichText(
    _children,
    align: _align,
    textDirection: dir,
    overflow: _overflow,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  /// Sets max lines.
  VRichText maxLines(int n) => VRichText(
    _children,
    align: _align,
    textDirection: _textDirection,
    overflow: _overflow,
    maxLines: n,
    textHeightBehavior: _textHeightBehavior,
  );

  /// Clips overflow.
  VRichText get overflowClip => VRichText(
    _children,
    align: _align,
    textDirection: _textDirection,
    overflow: TextOverflow.clip,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  // ===== Build =====

  /// Builds the Flutter [RichText] widget.
  RichText make() => RichText(
    text: TextSpan(children: _children),
    textAlign: _align ?? TextAlign.start,
    textDirection: _textDirection,
    maxLines: _maxLines,
    overflow: _overflow ?? TextOverflow.clip,
    textHeightBehavior: _textHeightBehavior,
  );
}

/// Extension to convert [String] to [VRichText].
extension KaeruRichTextExtension on String {
  /// Converts a string to [VRichText].
  VRichText get richText => VRichText([TextSpan(text: this)]);
}
