import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'GoogleMapExControl.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

abstract class MarkerControlInterface {
  void addNewMarker({Marker? marker});
  void dispose();
  void clear();
  Set<Marker> get currentMarkers;
  Future<void> getBytesFromAsset({required String path, required int width});
}

abstract class MiddleMarkerControl implements MarkerControlInterface {
  final StreamController<Set<Marker>> _setMarker = StreamController();

  StreamController<Set<Marker>> get setMarker => _setMarker;

  @override
  void dispose() {
    _setMarker.close();
  }
}

class MarkerControl extends MiddleMarkerControl {
  final Set<Marker> _currentMarker = {};
  Uint8List? _uint8list;

  @override
  void addNewMarker({Marker? marker}) {
    if (marker == null) return;
    _currentMarker.add(marker);
    super._setMarker.sink.add(_currentMarker);
  }

  @override
  void clear() {
    _currentMarker.clear();
    super._setMarker.sink.add(_currentMarker);
  }

  @override
  Set<Marker> get currentMarkers => _currentMarker;

  @override
  Future<void> getBytesFromAsset({required String path,required int width}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
        data.buffer.asUint8List(),
        targetWidth: width
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    _uint8list = (await fi.image.toByteData(
        format: ui.ImageByteFormat.png))!
        .buffer.asUint8List();
    // return (await fi.image.toByteData(
    //     format: ui.ImageByteFormat.png))!
    //     .buffer.asUint8List();
  }

  @override
  Uint8List get uint8List => _uint8list ?? Uint8List(0);
}
