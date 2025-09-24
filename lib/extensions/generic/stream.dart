import 'package:flutter/material.dart';

/// Extension for concise `StreamBuilder` usage with customizable states.
///
/// This extension allows you to easily attach UI logic for different stream states:
/// - **success**: when new data is emitted
/// - **error**: when an error occurs
/// - **loading**: while waiting for the first value
/// - **noData**: when the stream completes without emitting data
///
/// Example:
/// ```dart
/// myStream.streamBuilder(
///   success: (ctx, data) => Text('Data: $data'),
///   error: (ctx, err) => Text('Error: $err'),
///   loading: (ctx) => const CircularProgressIndicator(),
///   noData: (ctx) => const Text('No data available'),
/// );
/// ```
extension KaeruStreamBuilder<T> on Stream<T> {
  /// Builds a `StreamBuilder` with shorthand callbacks for common states.
  ///
  /// [success] → required, called when the stream has data.  
  /// [error] → optional, called when the stream has an error. Defaults to a `Text` with the error message.  
  /// [loading] → optional, called when the stream is waiting. Defaults to an empty box.  
  /// [noData] → optional, called when the stream has no data and no error. Defaults to an empty box.  
  /// Example:
  /// ```dart
  /// myStream.streamBuilder(
  ///   success: (ctx, data) => Text('Data: $data'),
  ///   error: (ctx, err) => Text('Error: $err'),
  ///   loading: (ctx) => const CircularProgressIndicator(),
  ///   noData: (ctx) => const Text('No data available'),
  /// );
  /// ```
  Widget streamBuilder({
    required Widget Function(BuildContext, T data) success,
    Widget Function(BuildContext, Object? error)? error,
    Widget Function(BuildContext)? loading,
    Widget Function(BuildContext)? noData,
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
        return noData?.call(context) ?? const SizedBox.shrink();
      },
    );
  }
}
