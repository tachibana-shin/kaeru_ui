# Kaeru UI

Kaeru UI is a Flutter library that provides a set of useful extensions and widgets to enhance your development experience. This library simplifies common tasks and improves code readability by providing chainable methods and utility functions.

## Features

- **Animation Extensions**: Easily add animations to your widgets.
- **Badge Extensions**: Create badges for notifications or indicators.
- **Layout Extensions**: Simplify widget alignment and layout management.
- **Color and Styling Utilities**: Enhance your color management with chainable methods.
- **Responsive Design Helpers**: Make your app responsive across different screen sizes.
- **Rich Text Support**: Create rich text with various styles easily.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  kaeru_ui:
    git:
      url: https://github.com/your-repo/kaeru_ui.git
```

## Usage

### Animation Extensions

You can use the animation extensions to easily apply animations to your widgets. Here’s an example of using the `fadeIn` animation:

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class MyAnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, Kaeru!')
        .fadeIn(duration: Duration(seconds: 1));
  }
}
```

### Badge Extensions

To create a badge, you can use the `badge` extension:

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class MyBadgeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.notifications)
        .badge(bgColor: Colors.red, textColor: Colors.white);
  }
}
```

### Layout Extensions

You can easily align your widgets using the layout extensions:

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class MyLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Top Left').topLeft,
        Text('Centered').centered,
        Text('Bottom Right').bottomRight,
      ],
    );
  }
}
```

### Color Utilities

The library provides chainable methods for color manipulation:

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class MyColorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color myColor = Colors.blue
        .sr(100) // Change red value
        .sg(150) // Change green value
        .sb(200); // Change blue value

    return Container(color: myColor);
  }
}
```

### Responsive Design

Make your widgets responsive with the following example:

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class MyResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isXs ? 100 : 200,
      height: context.isSm ? 100 : 200,
      color: Colors.green,
    );
  }
}
```

## Conclusion

Kaeru UI provides a comprehensive set of extensions and utilities to enhance your Flutter development experience. By using these features, you can write cleaner and more maintainable code.

For more information and examples, please refer to the documentation or the source code in the repository.