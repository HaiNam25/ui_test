import 'package:pindias_app/domain/entities/address.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/districts.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';
import 'package:pindias_app/presentation/view/filter/provider/filter_provider.dart';
import 'package:pindias_app/presentation/view/gg_map/dto/search_map_dto.dart';

abstract class FilterControlInterface {
  void getData({required SearchMapDto searchMapDto});
  void getRealEstateType({RealEstateType? realEstateType});
  void getProvinces();
  void getDistrictsByProvince({String? provinceId});
}

abstract class MiddleFilterControl implements FilterControlInterface {
  Stream<Category<RealEstate>?>? _dataCategory = null;
  Stream<Category<RealEstateType>?>? _realEstateType = null;
  Stream<Address?>? _provinces = null;
  Stream<Districts?>? _districts = null;

  bool get isHasDataCategory => _dataCategory != null;
  bool get isHasRealEstateType => _realEstateType != null;
  bool get isHasProvinces => _provinces != null;
  bool get isHasDistricts => _districts != null;

  Stream<Districts?>? get districts => _districts;

  Stream<Address?>? get provinces => _provinces;

  Stream<Category<RealEstateType>?>? get realEstateType => _realEstateType;

  Stream<Category<RealEstate>?>? get dataCategory => _dataCategory;
}

class FilterControl extends MiddleFilterControl {
  final FilterProviderRepo filterProviderRepo = FilterProviderImpl();

  @override
  void getData({required SearchMapDto searchMapDto}) {
    print('vao filter control');
    _dataCategory = filterProviderRepo.getData(searchMapDto: searchMapDto);
  }

  @override
  void getDistrictsByProvince({String? provinceId}) {
    _districts = filterProviderRepo.getDistrictsByProvince(provinceId: provinceId);
  }

  @override
  void getProvinces() {
    _provinces = filterProviderRepo.getProvinces();
  }

  @override
  void getRealEstateType({RealEstateType? realEstateType}) {
    _realEstateType = filterProviderRepo.getRealEstateType(realEstateType: realEstateType);
  }
}