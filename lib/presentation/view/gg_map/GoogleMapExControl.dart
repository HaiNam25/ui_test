import 'package:custom_info_window/custom_info_window.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/path_curve.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/presentation/view/gg_map/provider/google_map_ex_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class GoogleMapExControlInterface {
  void zoom();
  void initCustomInfoWindowController(CustomInfoWindowController customInfoWindowController);
  void showCustomInfoWindow({Set<Marker>? markers});
  void getPolygonIdByListLatLng({PathCurve? pathCurve});
  void getAllDataByPolygonId({required String polygonId});
  void setDefaultStreamValue();
}

abstract class MiddleGoogleMapExControl implements GoogleMapExControlInterface {
  Stream<String>? _getPolygonId = null;
  Stream<Category<RealEstate>?>? _getCategory = null;

  Stream<String>? get getPolygonId => _getPolygonId;

  Stream<Category<RealEstate>?>? get getCategory => _getCategory;

  bool get isHasGetPolygonId => _getPolygonId != null;
  bool get isHasGetCategory => _getCategory != null;
}

class GoogleMapExControl extends MiddleGoogleMapExControl {
  static CustomInfoWindowController? _customInfoWindowController;
  static final GoogleMapExControl _googleMapExControl = GoogleMapExControl();
  final GoogleMapProviderRepo googleMapProviderRepo = GoogleMapProviderImpl();

  @override
  void initCustomInfoWindowController(CustomInfoWindowController customInfoWindowController) {
    _customInfoWindowController = customInfoWindowController;
  }

  CustomInfoWindowController? get customInfoWindowController =>
      _customInfoWindowController;

  bool get isHasGoogleMapControl => _customInfoWindowController != null;

  @override
  void zoom({double? zoom}) async {
    if (zoom == null || zoom <= 0 || !isHasGoogleMapControl) return;
    double currentZoom = await _customInfoWindowController?.googleMapController?.getZoomLevel() ?? 0;
    _customInfoWindowController!.googleMapController?.animateCamera(CameraUpdate.zoomTo(currentZoom + 1));
  }

  @override
  void showCustomInfoWindow({Set<Marker>? markers}) {
    if (!isHasGoogleMapControl || markers == null) return;
    for (var marker in markers) {
      _customInfoWindowController!.googleMapController?.showMarkerInfoWindow(marker.markerId);
      break;
    }
  }

  static GoogleMapExControl get getInstance => _googleMapExControl;

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
}