import 'dart:async';
import 'package:flutter/material.dart';

import '../model/draw_line.dart';

class AppBarControl {
  static double heightAppbar = 0.0;

  static void getSize(BuildContext context) {
    heightAppbar = MediaQuery.of(context).padding.top + kToolbarHeight;
  }
}

abstract class BaseWritingControl {
  void clear();

  void back();

  void changeStroke({double? width});

  void changeColorLine({Color? color});

  void dispose();
}

abstract class MiddleWritingControl implements BaseWritingControl {
  final StreamController<DrawnLine> _currentLineStream = StreamController.broadcast();
  final StreamController<List<DrawnLine>> _linesStream = StreamController.broadcast();
  final StreamController<Offset?> _posPencil = StreamController.broadcast();

  final List<DrawnLine> _lines = [];
  DrawnLine _currentLine = DrawnLine();

  @override
  void back() {
    if (_lines.isEmpty) return;
    _lines.removeAt(_lines.length - 1);

    // if after remove _lines is empty
    if (_lines.isEmpty) {
      _currentLine = DrawnLine();
    }
    else {
      _currentLine = _lines[_lines.length - 1];
    }

    _linesStream.sink.add(_lines);
    _currentLineStream.sink.add(_currentLine);
    if (_lines.isNotEmpty) {
      final DrawnLine _drawnLine = _lines[_lines.length - 1];
      final List<Offset>? _paths = _drawnLine.path;
      if (_paths == null) {
        _posPencil.sink.add(null);
      } else {
        if (_paths.isNotEmpty) {
          _posPencil.sink.add(_paths[_paths.length - 1]);
        } else {
          _posPencil.sink.add(null);
        }
      }
    } else {
      _posPencil.sink.add(null);
    }
  }

  @override
  void clear() {
    _lines.clear();
    _currentLine = DrawnLine();
    _linesStream.sink.add([]);
    _currentLineStream.sink.add(DrawnLine());
    _posPencil.sink.add(null);
  }

  @override
  void changeStroke({
    double? width,
  }) {
    _currentLine = _currentLine.copyWith(width: width, path: []);
    _currentLineStream.sink.add(_currentLine);
  }

  @override
  void changeColorLine({
    Color? color,
  }) {
    _currentLine = _currentLine.copyWith(color: color, path: []);
    _currentLineStream.sink.add(_currentLine);
  }

  @override
  void dispose() {
    _linesStream.close();
    _currentLineStream.close();
    _posPencil.close();
  }

  StreamController<List<DrawnLine>> get linesStream => _linesStream;

  StreamController<DrawnLine> get currentLineStream => _currentLineStream;

  DrawnLine get currentLine => _currentLine;

  List<DrawnLine> get lines => _lines;

  StreamController<Offset?> get posPencil => _posPencil;
}

class WritingControl extends MiddleWritingControl {
  void updateCurrentLineStreamControl() {
    super._currentLineStream.sink.add(super._currentLine);
  }

  void updateLinesStreamControl() {
    super._linesStream.sink.add(super._lines);
  }

  void updateCurrentLine({required DrawnLine drawLine}) {
    List<Offset>? paths = drawLine.path;
    Offset? point;
    if (paths != null && paths.isNotEmpty) {
      point = Offset(paths[paths.length - 1].dx,
          paths[paths.length - 1].dy - AppBarControl.heightAppbar);
      paths[paths.length - 1] = point;
    }

    super._currentLine = super._currentLine.copyWith(
          width: drawLine.width,
          color: drawLine.color,
          path: paths ?? [],
        );
  }

  void updateLines() {
    super._lines.add(super._currentLine);
  }

  void updatePosPencil({Offset? offset}) {
    super._posPencil.sink.add(offset);
  }

  void clearPencil() {
    super._posPencil.sink.add(null);
  }
}
