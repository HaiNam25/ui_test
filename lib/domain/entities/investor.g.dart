// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investor _$InvestorFromJson(Map<String, dynamic> json) => Investor(
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      createdBy: json['createdBy'] as int?,
      updatedBy: json['updatedBy'] as int?,
      deletedBy: json['deletedBy'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
      phone: json['phone'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      charteredCapital: json['charteredCapital'] as int?,
      createdYear: json['createdYear'] as String?,
      field: json['field'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InvestorToJson(Investor instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
      'deletedBy': instance.deletedBy,
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'website': instance.website,
      'phone': instance.phone,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'charteredCapital': instance.charteredCapital,
      'createdYear': instance.createdYear,
      'field': instance.field,
      'status': instance.status,
    };
