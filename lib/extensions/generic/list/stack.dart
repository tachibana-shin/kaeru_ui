extension KaeruStackListExt on List<Widget> {
  /// 
  /// Example:
  /// ```dart
  /// [
  ///   Container(color: Colors.red, width: 100, height: 100),
  ///   Text("On top"),
  /// ].stack(alignment: Alignment.center)
  /// ```
  Widget stack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      key: key,
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: this,
    );
  }
}