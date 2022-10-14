// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealEstateType _$RealEstateTypeFromJson(Map<String, dynamic> json) =>
    RealEstateType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RealEstateTypeToJson(RealEstateType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
    };
