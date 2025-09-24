/// Animation extensions for chainable entrance effects.
///
/// Example:
/// ```dart
/// Text('Hello').fadeIn().slideUp(distance: 30);
/// ```
library;

import 'package:flutter/material.dart';

/// Extension chainable animation & shimmer
extension KaeruAnimation on Widget {
  // Fade In
  Widget fadeIn({
    Key? key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeIn,
  }) {
    return _AnimatedWrapper(
      key: key,
      type: _AnimationType.fadeIn,
      duration: duration,
      curve: curve,
      child: this,
    );
  }

  // Slide Up
  Widget slideUp({
    Key? key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeOut,
    double distance = 50,
  }) {
    return _AnimatedWrapper(
      key: key,
      type: _AnimationType.slideUp,
      duration: duration,
      curve: curve,
      distance: distance,
      child: this,
    );
  }

  // Scale animation
  Widget scale({
    Key? key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return _AnimatedWrapper(
      key: key,
      type: _AnimationType.scale,
      duration: duration,
      curve: curve,
      scaleBegin: begin,
      scaleEnd: end,
      child: this,
    );
  }

  // Rotate animation
  Widget rotate({
    Key? key,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
    double begin = -0.5, // radians
    double end = 0.0,
  }) {
    return _AnimatedWrapper(
      key: key,
      type: _AnimationType.rotate,
      duration: duration,
      curve: curve,
      rotateBegin: begin,
      rotateEnd: end,
      child: this,
    );
  }
}

/// Internal wrapper for animations
enum _AnimationType { fadeIn, slideUp, scale, rotate }

class _AnimatedWrapper extends StatefulWidget {
  final Widget child;
  final _AnimationType type;
  final Duration duration;
  final Curve curve;
  final double distance;
  final double scaleBegin;
  final double scaleEnd;
  final double rotateBegin;
  final double rotateEnd;

  const _AnimatedWrapper({
    super.key,
    required this.child,
    required this.type,
    required this.duration,
    required this.curve,
    this.distance = 50,
    this.scaleBegin = 0.8,
    this.scaleEnd = 1.0,
    this.rotateBegin = -0.5,
    this.rotateEnd = 0.0,
  });

  @override
  State<_AnimatedWrapper> createState() => _AnimatedWrapperState();
}

class _AnimatedWrapperState extends State<_AnimatedWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  late final Animation<double> _scale;
  late final Animation<double> _rotate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);

    _fade = curved;

    _slide = Tween<Offset>(
      begin: Offset(0, widget.type == _AnimationType.slideUp ? 0.2 : 0),
      end: Offset.zero,
    ).animate(curved);

    _scale = Tween<double>(
      begin: widget.scaleBegin,
      end: widget.scaleEnd,
    ).animate(curved);

    _rotate = Tween<double>(
      begin: widget.rotateBegin,
      end: widget.rotateEnd,
    ).animate(curved);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child;

    switch (widget.type) {
      case _AnimationType.fadeIn:
        current = FadeTransition(opacity: _fade, child: current);
        break;
      case _AnimationType.slideUp:
        current = SlideTransition(position: _slide, child: current);
        break;
      case _AnimationType.scale:
        current = ScaleTransition(scale: _scale, child: current);
        break;
      case _AnimationType.rotate:
        current = RotationTransition(turns: _rotate, child: current);
        break;
    }

    return current;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
