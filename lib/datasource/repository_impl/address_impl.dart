import 'package:dio/dio.dart';
import 'package:pindias_app/domain/entities/address.dart';
import 'package:pindias_app/domain/repository/address_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/districts.dart';

class AddressImpl implements AddressRepo {
  final Dio dio = Dio()..options = BaseOptions(headers: {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2I'
        'iwiZmlyc3ROYW1lIjoiU3ByaW5nIiwibGFzdE5hbWUiOiLEkMOgbyIsInJvbGUiOiJBRE1J'
        'TiIsImlzcyI6Ik1ldGF3YXlob2xkaW5ncyIsImV4cCI6MTY2NTAzNzcxMywiZW1haWwiOi'
        'J4dWFuaHVuZzI0MDFAZ21haWwuY29tIn0.8Fh_z35XyYutj_rl_M8BSL7Dm0VpUNVWZg4K'
        'Vi35hYg'
  });

  @override
  Future<Address?> getProvinces() async {
    try {
      var response = await dio.get(
        'https://dev.pindias.com/api/v2/address/provinces',
      );
      if (response.data != null) {
        return Address.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<Districts?> getDistrictsByProvince({String? provinceId}) async {
    if (provinceId == null || provinceId.isEmpty) return null;
    try {
      var response = await dio.get(
        'https://dev.pindias.com/api/v2/address/province/$provinceId/districts'
      );
      if (response.data != null) {
        return Districts.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}