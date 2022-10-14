import 'package:pindias_app/domain/entities/path_curve.dart';

abstract class RedisSearchRepo {
  Future<String> getPolygonIdByListLatLng({PathCurve? pathCurve});
}