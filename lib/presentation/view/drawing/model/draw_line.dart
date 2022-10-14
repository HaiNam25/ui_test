import 'dart:ui';

class DrawnLine {
  final List<Offset>? path;
  final Color? color;
  final double? width;

  DrawnLine({
    this.path,
    this.color,
    this.width,
  });

  DrawnLine copyWith({
    List<Offset>? path,
    Color? color,
    double? width,
  }) {
    return DrawnLine(
      color: color ?? this.color,
      width: width ?? this.width,
      path: path ?? this.path,
    );
  }

  @override
  String toString() {
    return 'DrawnLine{path: $path, color: $color, width: $width}';
  }
}
