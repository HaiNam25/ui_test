import 'package:dio/dio.dart';
import 'package:pindias_app/domain/entities/path_curve.dart';
import 'package:pindias_app/domain/repository/redis_search_repo.dart';
import 'package:flutter/material.dart';

class RedisSearchImpl implements RedisSearchRepo {
  final Dio dio = Dio()..options = BaseOptions(headers: {
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2I'
        'iwiZmlyc3ROYW1lIjoiU3ByaW5nIiwibGFzdE5hbWUiOiLEkMOgbyIsInJvbGUiOiJBRE1J'
        'TiIsImlzcyI6Ik1ldGF3YXlob2xkaW5ncyIsImV4cCI6MTY2NTAzNzcxMywiZW1haWwiOi'
        'J4dWFuaHVuZzI0MDFAZ21haWwuY29tIn0.8Fh_z35XyYutj_rl_M8BSL7Dm0VpUNVWZg4K'
        'Vi35hYg'
  });
  @override
  Future<String> getPolygonIdByListLatLng({PathCurve? pathCurve}) async {
    if (pathCurve == null) return '';
    try {
      var response = await dio.post(
        "https://dev.pindias.com/api/redissearch/import-polygon",
        data: pathCurve.toJson(),
      );
      if (response.data != null) {
        return response.data;
      }
      return '';
    } catch (e) {
      debugPrint(e.toString());
    }
    return '';
  }

}