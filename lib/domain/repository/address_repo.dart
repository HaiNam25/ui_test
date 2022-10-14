import 'package:pindias_app/domain/entities/address.dart';
import '../../domain/entities/districts.dart';

abstract class AddressRepo {
  Future<Address?> getProvinces();
  Future<Districts?> getDistrictsByProvince({String? provinceId});
}