import 'package:flutter/material.dart';

/// Extension for concise `FutureBuilder` usage with customizable states.
///
/// This extension simplifies handling different states of a `Future<T>`:
/// - **success**: when the future completes with data
/// - **error**: when the future completes with an error
/// - **loading**: while waiting for the future to complete
/// - **noData**: when the future completes with no data
///
/// Example:
/// ```dart
/// myFuture.futureBuilder(
///   success: (ctx, data) => Text('Result: $data'),
///   error: (ctx, err) => Text('Error: $err'),
///   loading: (ctx) => const CircularProgressIndicator(),
///   noData: (ctx) => const Text('No result'),
/// );
/// ```
extension KaeruFutureBuilder<T> on Future<T> {
  /// Builds a `FutureBuilder` with shorthand callbacks for common states.
  ///
  /// [success] → required, called when the future resolves with data.
  /// [error] → optional, called when the future throws. Defaults to a `Text` with the error message.
  /// [loading] → optional, called while waiting for the future. Defaults to an empty box.
  /// [noData] → optional, called if the future completes without data. Defaults to an empty box.
  ///
  /// Example:
  /// ```dart
  /// myFuture.futureBuilder(
  ///   success: (ctx, data) => Text('Result: $data'),
  ///   error: (ctx, err) => Text('Error: $err'),
  ///   loading: (ctx) => const CircularProgressIndicator(),
  ///   noData: (ctx) => const Text('No result'),
  /// );
  /// ```
  Widget futureBuilder({
    required Widget Function(BuildContext, T data) success,
    Widget Function(BuildContext, Object? error)? error,
    Widget Function(BuildContext)? loading,
    Widget Function(BuildContext)? noData,
  }) {
    return FutureBuilder<T>(
      future: this,
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
