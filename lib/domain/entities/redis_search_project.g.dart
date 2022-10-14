// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redis_search_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedisSearchProject _$RedisSearchProjectFromJson(Map<String, dynamic> json) =>
    RedisSearchProject(
      totalResults: json['totalResults'] as num?,
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => DocsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RedisSearchProjectToJson(RedisSearchProject instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'docs': instance.docs,
    };

DocsBean _$DocsBeanFromJson(Map<String, dynamic> json) => DocsBean(
      id: json['id'] as String?,
      score: json['score'] as num?,
      payload: json['payload'],
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => PropertiesBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocsBeanToJson(DocsBean instance) => <String, dynamic>{
      'id': instance.id,
      'score': instance.score,
      'payload': instance.payload,
      'properties': instance.properties,
    };

PropertiesBean _$PropertiesBeanFromJson(Map<String, dynamic> json) =>
    PropertiesBean(
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PropertiesBeanToJson(PropertiesBean instance) =>
    <String, dynamic>{
      'description': instance.description,
    };
