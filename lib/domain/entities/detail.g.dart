// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      usageArea: (json['usageArea'] as num?)?.toDouble(),
      facade: (json['facade'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      condition: json['condition'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      panoramaId: json['panoramaId'] as String?,
      youtubeLink: json['youtubeLink'] as String?,
      link3dview: json['link3dview'] as String?,
      fullAddress: json['fullAddress'] as String?,
      locationDetail: json['locationDetail'] as String?,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'usageArea': instance.usageArea,
      'facade': instance.facade,
      'length': instance.length,
      'width': instance.width,
      'condition': instance.condition,
      'description': instance.description,
      'images': instance.images,
      'contact': instance.contact?.toJson(),
      'panoramaId': instance.panoramaId,
      'youtubeLink': instance.youtubeLink,
      'link3dview': instance.link3dview,
      'fullAddress': instance.fullAddress,
      'locationDetail': instance.locationDetail,
    };
