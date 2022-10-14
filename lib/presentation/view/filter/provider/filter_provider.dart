import 'package:pindias_app/datasource/repository_impl/address_impl.dart';
import 'package:pindias_app/datasource/repository_impl/real_estate_type_impl.dart';
import 'package:pindias_app/datasource/repository_impl/search_map_impl.dart';
import 'package:pindias_app/domain/entities/address.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/districts.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';
import 'package:pindias_app/domain/repository/address_repo.dart';
import 'package:pindias_app/domain/repository/real_estate_type_repo.dart';
import 'package:pindias_app/domain/repository/search_map_repo.dart';
import 'package:pindias_app/presentation/view/gg_map/dto/search_map_dto.dart';

abstract class FilterProviderRepo {
  Stream<Category<RealEstate>?> getData({required SearchMapDto searchMapDto});
  Stream<Category<RealEstateType>?> getRealEstateType({RealEstateType? realEstateType});
  Stream<Address?> getProvinces();
  Stream<Districts?> getDistrictsByProvince({String? provinceId});
}

class FilterProviderImpl implements FilterProviderRepo {
  final SearchMapRepo searchMapRepo = SearchMapImpl();
  final AddressRepo addressImpl = AddressImpl();
  final RealEstateTypeRepo realEstateTypeRepo = RealEstateTypeImpl();

  @override
  Stream<Category<RealEstate>?> getData({required SearchMapDto searchMapDto}) async* {
    yield await searchMapRepo.getData(searchMapDto: searchMapDto);
  }

  @override
  Stream<Districts?> getDistrictsByProvince({String? provinceId}) async* {
    yield await addressImpl.getDistrictsByProvince(
        provinceId: provinceId);
  }

  @override
  Stream<Address?> getProvinces() async* {
    yield await addressImpl.getProvinces();
  }

  @override
  Stream<Category<RealEstateType>?> getRealEstateType({RealEstateType? realEstateType}) async* {
    yield await realEstateTypeRepo.getRealEstateType(realEstateType: realEstateType);
  }

}