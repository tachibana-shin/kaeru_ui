import 'package:flutter/material.dart';

extension KaeruStreamBuilder<T> on Stream<T> {
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
