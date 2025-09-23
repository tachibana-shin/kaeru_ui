import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class ListHelpersExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Helpers Example')),
      body: Column(
        children: [
          // Example of hStack
          const Text('Horizontal Stack:'),
          const [Text('Item 1'), Text('Item 2'), Text('Item 3')].hStack(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          // Example of vStack
          const SizedBox(height: 20),
          const Text('Vertical Stack:'),
          const [Text('Item A'), Text('Item B'), Text('Item C')].vStack(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),

          // Example of wrap
          const SizedBox(height: 20),
          const Text('Wrap Example:'),
          const [
            Text('A'),
            Text('B'),
            Text('C'),
            Text('D'),
          ].wrap(spacing: 8, runSpacing: 4, alignment: WrapAlignment.center),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ListHelpersExample()));
}
