import 'package:flutter/material.dart';

import '../controller/writing_control.dart';
import '../model/draw_line.dart';
import 'writing_painter.dart';

class DrawAllPath extends StatelessWidget {
  final WritingControl writingControl;

  DrawAllPath({Key? key, required this.writingControl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: RepaintBoundary(
        child: StreamBuilder<List<DrawnLine>>(
          initialData: [DrawnLine()],
          stream: writingControl.linesStream.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: WritingPainter(
                lines: snapshot.data ?? [DrawnLine()],
              ),
            );
          },
        ),
      ),
    );
  }
}