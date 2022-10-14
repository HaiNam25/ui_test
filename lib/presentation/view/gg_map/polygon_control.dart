import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'GoogleMapExControl.dart';

abstract class PolygonControlInterface {
  void addNewPolygon({LatLng? latLng});

  void removeById({String? id});

  void clear();

  Future<void> convertOffsetToLatLng(
      {required double devicePixelRatio, required List<Offset> shape});

  Set<Polygon> get polygons;

}

abstract class MiddlePolygonControl extends GoogleMapExControl
    implements PolygonControlInterface {
  final StreamController<Set<Polygon>> _setPolygons = StreamController();

  StreamController<Set<Polygon>> get setPolygons => _setPolygons;

  void dispose() {
    _setPolygons.close();
  }
}

class PolygonControl extends MiddlePolygonControl {
  final Set<Polygon> _currentPolygon = HashSet<Polygon>();

  @override
  void addNewPolygon({String? id = 'default_polygon', LatLng? latLng}) {
    if (latLng == null) return;
    if (_currentPolygon.isEmpty) {
      _currentPolygon.add(Polygon(
        polygonId: const PolygonId('default_polygon'),
        points: [latLng],
        strokeWidth: 1,
        fillColor: Colors.transparent,
        strokeColor: const Color.fromRGBO(115, 21, 100, 1),
      ));
      super.setPolygons.sink.add(_currentPolygon);
      return;
    }

    bool isAdd = false;
    Polygon? p;
    for (var element in _currentPolygon) {
      if (element.mapsId.value == id) {
        List<LatLng> newPoints = [];
        for (var e in element.points) {
          newPoints.add(e);
        }
        newPoints.add(latLng);
        p = element.copyWith(
          pointsParam: newPoints,
          fillColorParam: const Color.fromRGBO(115, 21, 100, 0.2),
        );

        isAdd = true;
      }
    }
    if (isAdd) {
      removeById(id: id);
      _currentPolygon.add(p!);
    }

    super.setPolygons.sink.add(_currentPolygon);
  }

  @override
  void removeById({String? id}) {
    _currentPolygon.removeWhere((element) => element.polygonId.value == id);
  }

  @override
  void clear() {
    _currentPolygon.clear();
    super.setPolygons.sink.add(_currentPolygon);
  }

  @override
  Future<void> convertOffsetToLatLng(
      {required double devicePixelRatio, required List<Offset> shape}) async {
    if (shape.isEmpty || !isHasGoogleMapControl) return;
    _currentPolygon.clear();
    await Future.forEach(shape, (Offset point) async {
      LatLng p = await super.customInfoWindowController!.googleMapController!.getLatLng(ScreenCoordinate(
          x: (point.dx * devicePixelRatio).round(),
          y: ((point.dy + 0) * devicePixelRatio).round()));
      addNewPolygon(latLng: p);
    });

    zoom(zoom: 1);
  }

  @override
  Set<Polygon> get polygons => _currentPolygon;
}
