import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';

abstract class RealEstateTypeRepo {
  Future<Category<RealEstateType>?> getRealEstateType({RealEstateType? realEstateType});
}