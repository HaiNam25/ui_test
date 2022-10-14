import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/presentation/view/gg_map/dto/search_map_dto.dart';

abstract class SearchMapRepo {
  Future<Category<RealEstate>?> getData({required SearchMapDto searchMapDto});
}