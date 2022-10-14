import 'package:dio/dio.dart';
import 'package:pindias_app/domain/entities/category.dart';
import 'package:pindias_app/domain/entities/real_estate.dart';
import 'package:pindias_app/domain/repository/search_map_repo.dart';
import 'package:pindias_app/presentation/view/gg_map/dto/search_map_dto.dart';
import 'package:flutter/cupertino.dart';

import '../../print_long_string.dart';

class SearchMapImpl implements SearchMapRepo {
  final Dio dio = Dio()..options = BaseOptions(headers: {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2I'
        'iwiZmlyc3ROYW1lIjoiU3ByaW5nIiwibGFzdE5hbWUiOiLEkMOgbyIsInJvbGUiOiJBRE1J'
        'TiIsImlzcyI6Ik1ldGF3YXlob2xkaW5ncyIsImV4cCI6MTY2NTAzNzcxMywiZW1haWwiOi'
        'J4dWFuaHVuZzI0MDFAZ21haWwuY29tIn0.8Fh_z35XyYutj_rl_M8BSL7Dm0VpUNVWZg4K'
        'Vi35hYg'
  });

  @override
  Future<Category<RealEstate>?> getData({required SearchMapDto searchMapDto}) async {
    print('urt: ${searchMapDto.searchUri}');
    try {
      var res = await dio.get('https://dev.pindias.com/api/redissearch/search?${searchMapDto.searchUri}');
      if (res.data != null) {
        Category<RealEstate> category = Category.fromJson(res.data);
        PrintLongString.printLongString(category.toJson().toString());
        return category;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}