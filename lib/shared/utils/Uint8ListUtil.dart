import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class Uint8ListUtil {
  static Future<Uint8List> getBytesFromCanvas(int width, int height, {String? text}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    Rect rect = Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble());
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 15));
    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 15)
      ..relativeLineTo(15, -15)
      ..close();

    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()
      ..color = const Color.fromRGBO(115, 21, 100, 0.8)
    ;
    canvas.drawPath(path, paint);

    TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text ?? '',
      style: const TextStyle(fontSize: 40.0, color: Colors.white),
    );
    painter.layout();
    painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.65));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }
}