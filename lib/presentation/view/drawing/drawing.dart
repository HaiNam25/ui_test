import 'package:flutter/material.dart';

import 'controller/writing_control.dart';
import 'view/draw_all_path.dart';
import 'view/draw_current_path.dart';

class DrawingView extends StatefulWidget {
  final MiddleWritingControl? middleWritingControl;
  final Size? sizePencil;
  final bool? isShowPencil;
  final GestureDragEndCallback? onPanEnd;

  const DrawingView({
    Key? key,
    this.middleWritingControl,
    this.sizePencil,
    this.isShowPencil,
    this.onPanEnd,
  }) : super(key: key);

  @override
  _DrawingView createState() => _DrawingView();
}

class _DrawingView extends State<DrawingView> {
  late final WritingControl writingControl;
  final GlobalKey gestureDetector = GlobalKey();

  final GlobalKey allPathKey = GlobalKey();
  final GlobalKey currentPathKey = GlobalKey();

  @override
  void initState() {
    if (widget.middleWritingControl != null) {
      writingControl = widget.middleWritingControl as WritingControl;
    } else {
      writingControl = WritingControl();
    }
    super.initState();
  }

  @override
  void dispose() {
    //writingControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          DrawAllPath(writingControl: writingControl),
          DrawCurrentPath(
            key: currentPathKey,
            writingControl: writingControl,
            sizePencil: widget.sizePencil,
            isShowPencil: widget.isShowPencil,
            onPanEnd: widget.onPanEnd,
          ),
        ],
      ),
    );
  }
}
