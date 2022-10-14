import 'package:pindias_app/datasource/repository_impl/real_estate_impl.dart';
import 'package:pindias_app/datasource/repository_impl/redis_search_impl.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/path_curve.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/repository/real_estate_repo.dart';
import 'package:pindias_app/domain/repository/redis_search_repo.dart';

abstract class GoogleMapProviderRepo {
  Stream<String> getPolygonIdByListLatLng({PathCurve? pathCurve});
  Stream<Category<RealEstate>?> getAllDataByPolygonId({required String polygonId});
}

class GoogleMapProviderImpl implements GoogleMapProviderRepo {
  final RedisSearchRepo redisSearchRepo = RedisSearchImpl();
  final RealEstateRepo realEstateRepo = RealEstateImpl();

  @override
  Stream<Category<RealEstate>?> getAllDataByPolygonId({required String polygonId}) async* {
    yield await realEstateRepo.getAllDataByPolygonId(polygonId: polygonId);
  }

  @override
  Stream<String> getPolygonIdByListLatLng({PathCurve? pathCurve}) async* {
    yield await redisSearchRepo.getPolygonIdByListLatLng(pathCurve: pathCurve);
  }

}