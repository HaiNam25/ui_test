import 'package:pindias_app/shared/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/writing_control.dart';
import '../model/draw_line.dart';
import 'writing_painter.dart';

class DrawCurrentPath extends StatelessWidget {
  final WritingControl writingControl;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  final Size? sizePencil;
  final bool? isShowPencil;

  DrawCurrentPath({
    Key? key,
    required this.writingControl,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.sizePencil,
    this.isShowPencil = false,
  }) : super(key: key);

  void _onPanStart(DragStartDetails details) {
    Offset position =
        Offset(details.globalPosition.dx, details.globalPosition.dy);
    writingControl.updateCurrentLine(drawLine: DrawnLine(path: [position]));
  }

  void _onPanUpdate(DragUpdateDetails details) {
    List<Offset> newPaths =
        List<Offset>.from(writingControl.currentLine.path ?? [])
          ..add(details.globalPosition);

    writingControl.updateCurrentLine(drawLine: DrawnLine(path: newPaths));
    writingControl.updateCurrentLineStreamControl();
    writingControl.updatePosPencil(offset: newPaths[newPaths.length - 1]);
  }

  void _onPanEnd(DragEndDetails details) {
    writingControl.updateLines();
    writingControl.updateLinesStreamControl();
    writingControl.updatePosPencil(offset: null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        onTap: () {
          print('on tap');
        },
        onPanStart: (details) {
          _onPanStart(details);
          if (onPanStart != null) {
            onPanStart!(details);
          }
        },
        onPanUpdate: (details) {
          _onPanUpdate(details);
          if (onPanUpdate != null) {
            onPanUpdate!(details);
          }
        },
        onPanEnd: (details) {
          _onPanEnd(details);
          if (onPanEnd != null) {
            onPanEnd!(details);
          }
        },
        child: RepaintBoundary(
          child: StreamBuilder<DrawnLine>(
            initialData: DrawnLine(),
            stream: writingControl.currentLineStream.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: WritingPainter(
                  lines: [
                    snapshot.data ?? DrawnLine(),
                  ],
                ),
                child: StreamBuilder<Offset?>(
                  stream: writingControl.posPencil.stream,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: snapshot.hasData && isShowPencil!,
                      child: Stack(
                        children: [
                          Positioned(
                            top: (snapshot.data?.dy ??
                                    sizePencil?.height ??
                                    30) -
                                (sizePencil?.height ?? 30),
                            left:
                                (snapshot.data?.dx ?? sizePencil?.width ?? 5) -
                                    (sizePencil?.width ?? 5),
                            child: Image.asset(
                              AppImages.pencil,
                              height: sizePencil?.height ?? 30,
                              width: sizePencil?.width ?? 30,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
