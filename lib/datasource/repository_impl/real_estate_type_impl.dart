import 'package:dio/dio.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate_type.dart';
import 'package:pindias_app/domain/repository/real_estate_type_repo.dart';
import 'package:pindias_app/print_long_string.dart';
import 'package:flutter/cupertino.dart';

class RealEstateTypeImpl implements RealEstateTypeRepo {
  final Dio dio = Dio()..options = BaseOptions(headers: {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2I'
        'iwiZmlyc3ROYW1lIjoiU3ByaW5nIiwibGFzdE5hbWUiOiLEkMOgbyIsInJvbGUiOiJBRE1J'
        'TiIsImlzcyI6Ik1ldGF3YXlob2xkaW5ncyIsImV4cCI6MTY2NTY0NTU0MSwiZW1haWwiOiJ'
        '4dWFuaHVuZzI0MDFAZ21haWwuY29tIn0.K27p-OQZq9K4f770JZEYwq-PHmnfCJk4A4p4BW'
        'ms6m4'
  });

  @override
  Future<Category<RealEstateType>?> getRealEstateType({RealEstateType? realEstateType}) async {
    try {
      var response = await dio.get(
        "https://dev.pindias.com/api/v2/category?page=0&size=10&${realEstateType?.getUri}",
      );
      if (response.data != null) {
        Category<RealEstateType> category = Category<RealEstateType>.fromJson(response.data);
        PrintLongString.printLongString(category.toJson().toString());
        return Category<RealEstateType>.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}