import 'package:flutter/widgets.dart';

extension KaeruFutureBuilder<T> on Future<T> {
  Widget futureBuilder({
    required Widget Function(BuildContext, T data) success,
    Widget Function(BuildContext, Object? error)? error,
    Widget Function(BuildContext)? loading,
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
        return const SizedBox.shrink();
      },
    );
  }
}
