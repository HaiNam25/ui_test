// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_curve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PathCurve _$PathCurveFromJson(Map<String, dynamic> json) => PathCurve(
      paths: (json['paths'] as List<dynamic>?)
          ?.map((e) => CoordinatesGoogleMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PathCurveToJson(PathCurve instance) => <String, dynamic>{
      'paths': instance.paths?.map((e) => e.toJson()).toList(),
    };
