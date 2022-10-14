import 'dart:async';

import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'flutter_map_ex_control.dart';

abstract class PolygonControlInterface {
  void addNewPolygon({LatLng? latLng});

  void removeById({String? id});

  void clear();

  Future<void> convertOffsetToLatLng(
      {required double devicePixelRatio, required List<Offset> shape});

  Category<RealEstate> get category;

  Polygon get currentPolygon;
}

abstract class MiddlePolygonController extends FlMapExControl
    implements PolygonControlInterface {
  final StreamController<Polygon> _polygonStream = StreamController();

  StreamController<Polygon> get setPolygonStream => _polygonStream;

  void dispose() {
    _polygonStream.close();
  }
}

class PolygonController extends MiddlePolygonController {
  final Polygon _currentPolygon = Polygon(
    points: [],
    color: const Color.fromRGBO(115, 21, 100, 0.2),
    isFilled: true,
    borderColor: const Color.fromRGBO(115, 21, 100, 0.8),
    borderStrokeWidth: 1.0,
  );

  Category<RealEstate> _category = Category();

  @override
  void addNewPolygon({String? id = 'default_polygon', LatLng? latLng}) {
    if (latLng == null) return;
    _currentPolygon.points.add(latLng);
    super.setPolygonStream.sink.add(_currentPolygon);
  }

  @override
  void removeById({String? id}) {}

  @override
  void clear() {
    _currentPolygon.points.clear();
    super.setPolygonStream.sink.add(_currentPolygon);
  }

  @override
  Future<void> convertOffsetToLatLng(
      {required double devicePixelRatio, required List<Offset> shape}) async {
    if (shape.isEmpty) return;
    await Future.forEach(shape, (Offset point) async {
      LatLng? p = await FlMapExControl.mapController
          .pointToLatLng(CustomPoint(point.dx, point.dy));
      addNewPolygon(latLng: p);
    });

    // zoom(zoom: 1);
  }

  @override
  Category<RealEstate> get category => _category;

  @override
  Polygon get currentPolygon => _currentPolygon;
}
