/// Extension for concise StreamBuilder usage.
///
/// Example:
/// ```dart
/// myStream.streamBuilder(
///   success: (ctx, data) => Text('$data'),
///   loading: (_) => CircularProgressIndicator(),
/// );
/// ```

import 'package:flutter/material.dart';

/// Wraps Stream<T> in a StreamBuilder with success/error/loading builders.
extension KaeruStreamBuilder<T> on Stream<T> {
  /// Example:
  /// ```dart
  /// stream.streamBuilder(
  ///   success: (ctx, data) => Text('$data'),
  ///   error: (ctx, err) => Text('Error: $err'),
  ///   loading: (ctx) => CircularProgressIndicator(),
  /// );
  /// ```
  Widget streamBuilder({
    required Widget Function(BuildContext, T data) success,
    Widget Function(BuildContext, Object? error)? error,
    Widget Function(BuildContext)? loading,
  }) {
    return StreamBuilder<T>(
      stream: this,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading?.call(context) ?? const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return error?.call(context, snapshot.error) ??
              Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          return success(context, snapshot.data as T);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
