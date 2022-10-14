import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';

abstract class RealEstateRepo {
  Future<Category<RealEstate>?> getAllDataByPolygonId({required String polygonId});
  Future<Category<RealEstate>?> getDataById({required String id});
}