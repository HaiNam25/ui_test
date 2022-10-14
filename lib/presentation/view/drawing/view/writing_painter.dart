import 'package:flutter/material.dart';

import '../model/draw_line.dart';

class WritingPainter extends CustomPainter {
  final List<DrawnLine>? lines;
  WritingPainter({
    required this.lines,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (lines == null || lines!.isEmpty) return;
    for (var element in lines!) {
      if (element.path == null) continue;
      for (int i = 0; i < element.path!.length - 1; i++) {
        Color color = element.color ?? const Color.fromRGBO(115, 21, 100, 1);
        double width = element.width ?? 1;
        final Paint paint = Paint()
          ..color = color
          ..strokeWidth = width;

        final p = Paint();
        p.style;
        canvas.drawLine(
          element.path![i],
          element.path![i + 1],
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
