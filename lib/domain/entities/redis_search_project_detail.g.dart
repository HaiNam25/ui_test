// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redis_search_project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedisSearchProjectDetail _$RedisSearchProjectDetailFromJson(
        Map<String, dynamic> json) =>
    RedisSearchProjectDetail(
      id: json['id'] as String?,
      score: json['score'] as num?,
      payload: json['payload'],
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => PropertiesBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RedisSearchProjectDetailToJson(
        RedisSearchProjectDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'payload': instance.payload,
      'properties': instance.properties,
    };

PropertiesBean _$PropertiesBeanFromJson(Map<String, dynamic> json) =>
    PropertiesBean(
      description: json['description'],
    );

Map<String, dynamic> _$PropertiesBeanToJson(PropertiesBean instance) =>
    <String, dynamic>{
      'description': instance.description,
    };
