// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ward _$WardFromJson(Map<String, dynamic> json) => Ward(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      slug: json['slug'] as String?,
      nameWithType: json['nameWithType'] as String?,
      path: json['path'] as String?,
      pathWithType: json['pathWithType'] as String?,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'slug': instance.slug,
      'nameWithType': instance.nameWithType,
      'path': instance.path,
      'pathWithType': instance.pathWithType,
      'parentId': instance.parentId,
    };
