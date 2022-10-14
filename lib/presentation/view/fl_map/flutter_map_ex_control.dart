import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/presentation/view/gg_map/provider/google_map_ex_provider.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:pindias_app/domain/entities/path_curve.dart';
import 'package:latlong2/latlong.dart';

abstract class FlMapExControlInterface {
  void zoomTo({LatLng? center});
  void zoomIn({double? zoomLevel});
  void zoomOut({double? zoomLevel});
  void getPolygonIdByListLatLng({PathCurve? pathCurve});
  void getAllDataByPolygonId({required String polygonId});
  void setDefaultStreamValue();
}

abstract class MiddleFlMapExControl implements FlMapExControlInterface {
  Stream<String>? _getPolygonId = null;
  Stream<Category<RealEstate>?>? _getCategory = null;

  Stream<String>? get getPolygonId => _getPolygonId;

  Stream<Category<RealEstate>?>? get getCategory => _getCategory;

  bool get isHasGetPolygonId => _getPolygonId != null;
  bool get isHasGetCategory => _getCategory != null;
}

class FlMapExControl extends MiddleFlMapExControl {
  final GoogleMapProviderRepo googleMapProviderRepo = GoogleMapProviderImpl();
  static MapController mapController = MapController();

  @override
  void getAllDataByPolygonId({required String polygonId}) {
    super._getCategory = googleMapProviderRepo.getAllDataByPolygonId(polygonId: polygonId);
  }

  @override
  void getPolygonIdByListLatLng({PathCurve? pathCurve}) {
    super._getPolygonId = googleMapProviderRepo.getPolygonIdByListLatLng(pathCurve: pathCurve);
  }

  @override
  void setDefaultStreamValue() async {
    super._getPolygonId = null;
    super._getCategory = null;
  }

  @override
  void zoomTo({LatLng? center}) {
    double currentZoom = mapController.zoom;
    currentZoom = currentZoom > 12 ? currentZoom - 0.5 : currentZoom + 1;
    LatLng centerLatLng = center ?? LatLng(20.92335669088932, 105.78998610377312);
    mapController.move(centerLatLng, currentZoom);
  }

  @override
  void zoomIn({double? zoomLevel}) {
    LatLng currentCenter = mapController.center;
    mapController.moveAndRotate(currentCenter, mapController.zoom + 1, 2.0);
  }

  @override
  void zoomOut({double? zoomLevel}) {
    LatLng currentCenter = mapController.center;
    mapController.moveAndRotate(currentCenter, mapController.zoom - 1, 2.0);
  }
}