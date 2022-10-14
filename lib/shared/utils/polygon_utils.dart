import 'package:pindias_app/domain/entities/coordinates_ggmap.dart';

class PolygonUtils {
  static CoordinatesGoogleMap? getCenterPolygon({List<CoordinatesGoogleMap>? points}) {
    if (points == null || points.isEmpty) return null;
    double minX = points[0].lat ?? 0;
    double minY = points[0].lng ?? 0;
    double maxX = points[0].lat ?? 0;
    double maxY = points[0].lng ?? 0.0;
    points.forEach((element) {
      if (element.lat! < minX) minX = element.lat!;
      if (element.lat! > maxX) maxX = element.lat!;
      if (element.lng! < minY) minY = element.lng!;
      if (element.lng! > maxY) maxY = element.lng!;
    });

    return CoordinatesGoogleMap(
      lat: minX + (maxX - minX)/2,
      lng: minY + (maxY - minY)/2,
    );
  }
}