[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tachibana-shin/kaeru_ui)

# Kaeru UI Extension Library

Kaeru UI is a Flutter extension library that provides chainable, declarative syntax for building UI more concisely and expressively. It extends core Dart and Flutter types with additional utilities, and introduces **Virtual Widgets** for fluent UI composition.

## Features

- 🚀 Chainable extensions on `Widget`, `String`, `Color`, `Future`, `Stream`, etc.
- 🎨 Syntactic sugar for padding, margin, alignment, transforms, and animations.
- 📦 Virtual widgets (`VContainer`, `VText`, `VRichText`) for fluent UI building.
- ⚡ Simplifies common Flutter patterns (stacks, wraps, padding, inkwell, etc.).
- 💡 Inspired by frameworks like **VelocityX**, **TailwindCSS**, and **Vue**.

## Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  kaeru_ui:
    git:
      url: https://github.com/tachibana-shin/kaeru_ui.git
```

Then import it:

```dart
import 'package:kaeru_ui/kaeru_ui.dart';
```

## Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:kaeru_ui/kaeru_ui.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "Hello Kaeru"
            .text
            .lg
            .red(600)
            .underline
            .make()
            .p(12)
            .inkWell(onTap: () => print("Tapped!"))
            .fadeIn(),
      ),
    );
  }
}
```

---

### For Large Language Models (LLMs)

This project includes a `llm.txt` file that contains all public APIs (functions, getters, extensions, etc.) and their corresponding documentation. This file is specifically formatted to be easily ingested by Large Language Models to provide them with the full context of this library.

**How to use:**

You can copy the entire content of `llm.txt` and paste it into your chat with an LLM to "teach" it about this library. Afterwards, the LLM will be able to accurately answer questions or generate code snippets using this library.

---

# Kaeru UI Responsive System

Kaeru UI provides a **responsive grid system** and **helper extensions**
inspired by Bootstrap and Tailwind.\
This system allows you to easily build responsive layouts in Flutter.

---

## 📏 Breakpoints

The following breakpoints are defined:

Name Width (px) Description

---

xs \< 400 Extra small devices
sm 400--600 Small devices
md 600--1024 Medium devices
lg 1024--1440 Large devices
xl \> 1440 Extra large devices

```dart
class Breakpoints {
  static double xs = 400;
  static double sm = 600;
  static double md = 1024;
  static double lg = 1440;
}
```

---

## 🛠️ Responsive Helpers

Kaeru UI extends `BuildContext` with responsive helper properties and
methods.

### Properties

```dart
context.isXs; // true if width < 400
context.isSm; // true if 400 <= width < 600
context.isMd; // true if 600 <= width < 1024
context.isLg; // true if 1024 <= width < 1440
context.isXl; // true if width >= 1440
```

Shortcuts:

- `xsOnly`, `smOnly`, `mdOnly`, `lgOnly`, `xlOnly`
- `xsDown`, `smDown`, `mdDown`, `lgDown`
- `smUp`, `mdUp`, `lgUp`

### Responsive Value

Choose a value based on the current breakpoint:

```dart
final fontSize = context.responsiveValue(
  xs: 12.0,
  sm: 14.0,
  md: 16.0,
  lg: 18.0,
  xl: 20.0,
);
```

---

## 👁️ Responsive Widget Extensions

You can show/hide widgets depending on breakpoints:

```dart
Text("Mobile only").xsOnly(context);
Text("Tablet only").mdOnly(context);
Text("Desktop and up").lgUp(context);
```

All available helpers:

- `xsOnly(context)`
- `smOnly(context)`
- `mdOnly(context)`
- `lgOnly(context)`
- `xlOnly(context)`
- `xsDown(context)`
- `smDown(context)`
- `mdDown(context)`
- `smUp(context)`
- `mdUp(context)`
- `lgUp(context)`

---

## 📐 GridRow

`GridRow` is a responsive grid layout that adapts the number of columns
based on the current breakpoint.

```dart
GridRow(
  xs: 2,
  sm: 3,
  md: 4,
  lg: 6,
  xl: 8,
  spacing: 12,
  runSpacing: 12,
  children: [
    Container(color: Colors.red, height: 100),
    Container(color: Colors.blue, height: 100),
  ],
);
```

---

## 📐 FlexRow and FlexCol

Kaeru UI also provides a Bootstrap-like **Row/Col system**.

### FlexRow

`FlexRow` arranges children in a responsive flex row (based on 12-column
system).

### FlexCol

`FlexCol` defines how many columns the child should span at each
breakpoint.

```dart
FlexRow(
  spacing: 12,
  runSpacing: 12,
  children: [
    FlexCol(
      xs: 12,
      sm: 6,
      md: 4,
      child: Container(color: Colors.red, height: 120),
    ),
    FlexCol(
      xs: 12,
      sm: 6,
      md: 8,
      child: Container(color: Colors.blue, height: 120),
    ),
    FlexCol(
      xs: 6,
      sm: 4,
      md: 3,
      child: Container(color: Colors.green, height: 120),
    ),
  ],
);
```

👉 Behavior: - At **xs**, columns span full width or half width. - At
**sm/md/lg/xl**, they resize based on grid fractions (12 columns
total). - Uses `Wrap` internally, so columns automatically wrap to the
next line.

---

## 🧩 Extensions for Flex API

### On `List<FlexCol>`

```dart
extension KaeruFlexListColExt on List<FlexCol> {
  FlexRow toFlex({
    Key? key,
    double spacing = 8,
    double runSpacing = 8,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) => FlexRow(
    key: key,
    spacing: spacing,
    runSpacing: runSpacing,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: mainAxisAlignment,
    children: this,
  );
}
```

### On `List<Widget>`

```dart
extension KaeruFlexListExt on List<Widget> {
  List<FlexCol> toFlexCol({
    Key? key,
    int xs = 12,
    int? sm,
    int? md,
    int? lg,
    int? xl,
  }) => map(
    (child) =>
        FlexCol(key: key, xs: xs, sm: sm, md: md, lg: lg, xl: xl, child: child),
  ).toList();

  FlexRow toFlex({
    int xs = 12,
    int? sm,
    int? md,
    int? lg,
    int? xl,

    double spacing = 8,
    double runSpacing = 8,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) => toFlexCol(xs: xs, sm: sm, md: md, lg: lg, xl: xl).toFlex(
    spacing: spacing,
    runSpacing: runSpacing,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisAlignment: mainAxisAlignment,
  );
}
```

✅ This allows turning a `List<Widget>` directly into a responsive **FlexRow** with columns.

---

## ✅ Summary

- `BuildContext` provides responsive helpers (`isXs`, `mdUp`, etc.).
- `responsiveValue()` lets you pick values per breakpoint.
- `Widget` extensions enable visibility control (`xsOnly`, `mdUp`,
  etc.).
- `GridRow` provides a responsive grid with a defined number of
  columns.
- `FlexRow` + `FlexCol` replicate Bootstrap's row/col system
  (12-column layout).

This makes **Kaeru UI** a complete responsive system for Flutter.

---

(Generated by docuwriter.ai)

# Kaeru UI Extension Library Documentation

Below you’ll find detailed documentation for each file in the Kaeru UI extension library. These extensions streamline Flutter UI code by enabling chainable, declarative syntax.

## Generic Extensions

These extensions augment core Dart and Flutter types with handy utilities.

### lib/extensions/generic/list/flex.dart

Provides **hStack/row** and **vStack/column** builders on `List<Widget>` for concise Flex layouts.

- **hStack** / **row**: Creates a `Row` from the list.
- **vStack** / **column**: Creates a `Column` from the list.

```dart
const [Text('A'), Text('B'), Text('C')]
  .hStack(mainAxisAlignment: MainAxisAlignment.spaceBetween);
```

### lib/extensions/generic/list/flex_gap.dart

Adds gap support between children in Flex layouts.

- **hStackWithGap**: Horizontal stack with configurable `gap`.
- **vStackWithGap**: Vertical stack with configurable `gap`.

```dart
const [Text('1'), Text('2'), Text('3')]
  .hStackWithGap(gap: 8, mainAxisSize: MainAxisSize.min);
```

### lib/extensions/generic/list/wrap.dart

Builds a `Wrap` widget from `List<Widget>` with spacing options.

- **wrap**: Wrap with parameters for `spacing`, `runSpacing`, alignment, and direction.

```dart
const [Text('A'), Text('B'), Text('C')]
  .wrap(spacing: 4, runSpacing: 8);
```

### lib/extensions/generic/color.dart

Enables chainable color channel and semantic color access.

- **sr/sg/sb/sa**: Set red/green/blue/alpha channel.
- **o**: Set overall opacity.
- **ColorPalette**: Predefined palette (`primary`, `success`, etc.).
- **KaeruSemanticColor**: Access palette via `color.primary`.

```dart
Colors.blue
  .sa(200)        // set alpha
  .o(0.5)         // set opacity
  .secondary;     // switch to secondary palette color
```

### lib/extensions/generic/edge_insets.dart

Merges two `EdgeInsets` by adding their values.

- **merge**: Returns the sum of two insets.

```dart
const EdgeInsets.all(8).merge(const EdgeInsets.symmetric(horizontal: 4));
```

### lib/extensions/generic/future.dart

Wraps `Future<T>` in a Flutter `FutureBuilder` with concise callbacks.

- **futureBuilder**: Specify `success`, optional `error`, and `loading` builders.

```dart
myFuture.futureBuilder(
  success: (ctx, data) => Text('$data'),
  loading: (_) => CircularProgressIndicator(),
);
```

### lib/extensions/generic/int.dart

Converts integer hex values to `Color`.

- **color**: Interprets `int` as ARGB color.

```dart
0xFF112233.color   // Color(0xFF112233)
```

### lib/extensions/generic/num.dart

Provides screen-percent sizing, padding/margin shorthands, durations, and number formatting.

- **w/h/sp**: Percent of screen width/height for size or font.
- **p, px, py, pt, pb, pl, pr, m, mx, my, mt, mb, ml, mr**: `EdgeInsets`.
- **seconds, milliseconds, minutes, hours**: `Duration`.
- **toFixed**: Format number of decimal places.

```dart
20.w(context)        // 20% of screen width
8.p                  // EdgeInsets.all(8)
5.seconds            // Duration(seconds: 5)
3.14159.toFixed(2)   // "3.14"
```

### lib/extensions/generic/stream.dart

Wraps `Stream<T>` in a `StreamBuilder` with concise callbacks.

- **streamBuilder**: Specify `success`, optional `error`, and `loading` builders.

```dart
myStream.streamBuilder(
  success: (ctx, data) => Text('$data'),
  loading: (_) => CircularProgressIndicator(),
);
```

### lib/extensions/generic/string.dart

Enhances `String` with case conversions, parsing, email check, and text builder.

- **capitalize, titleCase, camelCase, snakeCase**: Case transformations.
- **isEmail**: Basic email regex check.
- **toInt, toDouble**: Safe parsing.
- **text**: Wraps string into `VText` for further styling.

```dart
'hello_world'.camelCase    // "helloWorld"
'3.14'.toDouble            // 3.14
'user@example.com'.isEmail // true
```

### lib/extensions/generic/string_avatar.dart

Treats `String` as image URL and builds a `CircleAvatar`.

- **avatar**: Parameters for `radius` and `backgroundColor`.

```dart
'https://.../avatar.png'
  .avatar(radius: 24, backgroundColor: Colors.blueGrey);
```

## Widget Extensions

These chainable extensions simplify common widget wrappers.

### lib/extensions/animate.dart

Chainable entrance animations: fade in, slide up, scale, rotate.

- **fadeIn**, **slideUp**, **scale**, **rotate**: Customize `duration`, `curve`, and parameters like `distance` or `begin`/`end`.

```dart
Text('Hello').fadeIn().slideUp(distance: 30);
```

### lib/extensions/badge.dart

Wraps a widget in a badge-style container.

- **badge**: Configure `bgColor`, `textColor`, `paddingH/V`, `borderRadius`, `fontSize`.

```dart
Text('5').badge(bgColor: Colors.green, fontSize: 14);
```

### lib/extensions/box.dart

Begins a chainable `Container` builder via `VContainer`.

- **box**: Starts a `VContainer` chain.

```dart
Text('A').box.bg(Colors.red).rounded(4).make();
```

### lib/extensions/clip.dart

Quick clipping methods on any widget.

- **rounded(radius)**: `ClipRRect`.
- **circle**: `ClipOval`.
- **square(size)**: Sized box constraint.

```dart
Image.network(url).circle;
```

### lib/extensions/display.dart

Conditional display helpers.

- **show(bool)**: Shows or replaces with empty.
- **none**: Always hidden.

```dart
widget.show(isVisible);
```

### lib/extensions/flex.dart

Alignment, scrolling, and flex wrappers on any widget.

- **centered**, **topLeft**, etc.: Wrap in `Align`.
- **scrollable**: `SingleChildScrollView`.
- **expand**, **flexible**: Wrap in `Expanded` or `Flexible`.

```dart
Icon(Icons.home).centered.expand(flex: 2);
```

### lib/extensions/gesture.dart

Gesture detectors on any widget.

- **onTap**, **onDoubleTap**, **onLongPress**: Attach callbacks.

```dart
Text('Tap me').onTap(() => print('Tapped'));
```

### lib/extensions/icon.dart

Chainable size and color setters on `Icon`.

- **size**: Adjust icon size.
- **iconColor**: Adjust icon color.

```dart
Icon(Icons.add).size(30).iconColor(Colors.green);
```

### lib/extensions/image.dart

Chainable methods on `Image` widgets.

- **size(width, height)**: Set dimensions.
- **fitBox(BoxFit)**: Adjust `fit`.

```dart
Image.network(url).size(width: 100, height: 60).fitBox(BoxFit.cover);
```

### lib/extensions/ink_well.dart

Wrap any widget in an `InkWell` with configuration.

- **inkWell**: Tap, double-tap, long-press, hover, splash, etc.

```dart
Text('Click').inkWell(onTap: () => print('InkWell tapped'));
```

### lib/extensions/margin.dart

Shorthand margin helpers by combining `box` and generic `m` methods.

- **m, mx, my, mt, mb, ml, mr**: Apply margins via `VContainer`.

```dart
Text('Hi').m(8).make();
```

### lib/extensions/padding.dart

Shorthand padding on any widget.

- **pad(EdgeInsets)**, **p, px, py, pt, pb, pl, pr**: Directional `Padding`.

```dart
Text('Hello').p(12).px(8);
```

### lib/extensions/positioned.dart

Wrap in `Positioned` within a `Stack`.

- **positioned**: Set `top`, `left`, `right`, `bottom`, `width`, `height`.

```dart
Container().positioned(top: 0, left: 0);
```

### lib/extensions/responsive.dart

Responsive helpers based on `BuildContext` breakpoints.

- **isXs, isSm, isMd, isLg, isXl** on `BuildContext`.
- **xsOnly/..., mdUp**: Show/hide widgets at certain breakpoints.

```dart
Text('Mobile view').xsOnly(context);
```

### lib/extensions/spacing.dart

Numeric spacing shortcuts.

- **hSpace**, **vSpace**: `SizedBox` horizontal/vertical gaps.

```dart
5.0.hSpace;
10.0.vSpace;
```

### lib/extensions/text.dart

Bridges `Text` to `VText` for rich, chainable text styling.

- **text**: Convert `Text` to `VText` for further styling.

```dart
Text('Hello').text.color(Colors.red).size(18).make();
```

### lib/extensions/transform.dart

Chainable transforms.

- **rotate(radians)**: Rotate widget.
- **flipX**, **flipY**: Mirror horizontally/vertically.
- **translate(dx, dy)**: Translate widget.

```dart
Icon(Icons.arrow_upward).rotate(pi / 4).translate(dx: 10);
```

### lib/extensions/visibility.dart

Wrap in `Visibility` widget.

- **visible(flag, replacement)**: Show or replace.
- **hide**: Always hidden.

```dart
widget.visible(isActive, replacement: Text('Off'));
```

## Virtual Widgets

Provide fluent builders for complex widget trees.

### lib/virtual/v_container.dart

`VContainer` is a builder for `Container` with chainable methods:

- **childWidget**: Set child.
- **rounded**, **bg**: Border radius and background color.
- **padding**, **margin**: Insets.
- **size(width, height)**: Dimensions.
- **align**, **make()**: Alignment and final `Container`.

```dart
Text('A')
  .box.bg(Colors.blue)
  .rounded(12)
  .size(80, 40)
  .alignCenter
  .make();
```

### lib/virtual/v_rich_text.dart

`VRichText` builds a `RichText` with multiple `TextSpan` children:

- **bold**, **italic**, **color**, **size**, **underline**, etc.: Apply style to all spans.
- **align**, **textDirection**, **maxLines**, **overflowClip**: Layout.
- **make()**: Final `RichText` widget.
- **richText** on `String`: Starts a `VRichText` chain.

```dart
'Hello'.richText
  .bold
  .color(Colors.red)
  .underline
  .make();
```

### lib/virtual/v_text.dart

`VText` is a chainable text builder wrapping Flutter `Text`:

- **color**, **size**, **spacing**, **wordSpacing**, **opacity**, **letter spacing shortcuts** (`tight`, `wide`).
- **lineHeight** shortcuts (`lhTight`, `lhNormal`, etc.).
- **xs, sm, base, lg, xl, …**: Predefined font sizes.
- **make()**: Builds a `Text` widget.

```dart
'Kaeru UI'
  .text
  .lg
  .red(700)
  .tight
  .make();
```

## Entry Point

### lib/kaeru_ui.dart

Exports all extensions and virtual widgets in one import:

```dart
import 'package:kaeru_ui/kaeru_ui.dart';
```

This single import gives access to the entire fluent API.
