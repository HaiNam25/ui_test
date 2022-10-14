// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      type: json['type'] as String?,
      nameWithType: json['nameWithType'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'nameWithType': instance.nameWithType,
      'thumbnail': instance.thumbnail,
    };
