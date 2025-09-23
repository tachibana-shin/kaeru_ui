import 'package:flutter/material.dart';

class VRichText {
  final List<InlineSpan> _children;
  final TextAlign? _align;
  final TextDirection? _textDirection;
  final TextOverflow? _overflow;
  final int? _maxLines;
  final TextHeightBehavior? _textHeightBehavior;

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
  VRichText get bold => _applyStyleToAll(
    (old) => old.merge(const TextStyle(fontWeight: FontWeight.bold)),
  );
  VRichText get italic => _applyStyleToAll(
    (old) => old.merge(const TextStyle(fontStyle: FontStyle.italic)),
  );
  VRichText color(Color c) =>
      _applyStyleToAll((old) => old.merge(TextStyle(color: c)));
  VRichText size(double s) =>
      _applyStyleToAll((old) => old.merge(TextStyle(fontSize: s)));
  VRichText spacing(double v) =>
      _applyStyleToAll((old) => old.merge(TextStyle(letterSpacing: v)));
  VRichText get underline => _applyStyleToAll(
    (old) => old.merge(const TextStyle(decoration: TextDecoration.underline)),
  );
  VRichText get lineThrough => _applyStyleToAll(
    (old) => old.merge(const TextStyle(decoration: TextDecoration.lineThrough)),
  );

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
  VRichText align(TextAlign a) => VRichText(
    _children,
    align: a,
    textDirection: _textDirection,
    overflow: _overflow,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  VRichText textDirection(TextDirection dir) => VRichText(
    _children,
    align: _align,
    textDirection: dir,
    overflow: _overflow,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  VRichText maxLines(int n) => VRichText(
    _children,
    align: _align,
    textDirection: _textDirection,
    overflow: _overflow,
    maxLines: n,
    textHeightBehavior: _textHeightBehavior,
  );

  VRichText get overflowClip => VRichText(
    _children,
    align: _align,
    textDirection: _textDirection,
    overflow: TextOverflow.clip,
    maxLines: _maxLines,
    textHeightBehavior: _textHeightBehavior,
  );

  // ===== Build =====
  RichText make() => RichText(
    text: TextSpan(children: _children),
    textAlign: _align ?? TextAlign.start,
    textDirection: _textDirection,
    maxLines: _maxLines,
    overflow: _overflow ?? TextOverflow.clip,
    textHeightBehavior: _textHeightBehavior,
  );
}

extension KaeruRichTextExtension on String {
  VRichText get richText => VRichText([TextSpan(text: this)]);
}
