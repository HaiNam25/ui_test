import 'package:dio/dio.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/repository/real_estate_repo.dart';
import 'package:pindias_app/shared/utils/api_config.dart';
import 'package:flutter/material.dart';

import '../../print_long_string.dart';

class RealEstateImpl implements RealEstateRepo {
  final Dio dio = Dio()..options = BaseOptions(headers: {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2I'
        'iwiZmlyc3ROYW1lIjoiU3ByaW5nIiwibGFzdE5hbWUiOiLEkMOgbyIsInJvbGUiOiJBRE1J'
        'TiIsImlzcyI6Ik1ldGF3YXlob2xkaW5ncyIsImV4cCI6MTY2NTAzNzcxMywiZW1haWwiOi'
        'J4dWFuaHVuZzI0MDFAZ21haWwuY29tIn0.8Fh_z35XyYutj_rl_M8BSL7Dm0VpUNVWZg4K'
        'Vi35hYg'
  });

  @override
  Future<Category<RealEstate>?> getAllDataByPolygonId({required String polygonId}) async {
    try {
      Category<RealEstate>? category;
      var res = await dio.get(
          "https://dev.pindias.com/api/redissearch/search?polygonId=$polygonId&status=OPENING&page=1&size=${ApiConfig.maxSize}");
      if (res.data != null) {
        category = Category.fromJson(res.data as Map<String, dynamic>);
        PrintLongString.printLongString(category.toJson().toString());
        for (int i = 2; i < category.getTotalPages; i++) {

          var res = await dio.get(
              "https://dev.pindias.com/api/redissearch/search?polygonId=$polygonId&status=OPENING&page=$i}&size=${ApiConfig.maxSize}");
          Category<RealEstate> c = Category.fromJson(res.data as Map<String, dynamic>);
          category.content!.addAll(c.content ?? []);
        }
      }
      return category;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<Category<RealEstate>?> getDataById({required String id}) async {
    try {
      Category<RealEstate>? category;
      var res = await dio.get(
          "https://dev.pindias.com/api/v2/category/$id");
      if (res.data != null) {
        category = Category.fromJson(res.data as Map<String, dynamic>);
      }
      return category;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}