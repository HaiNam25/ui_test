// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
      sort: json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: json['pageNumber'] as int?,
      pageSize: json['pageSize'] as int?,
      offset: json['offset'] as int?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
      'sort': instance.sort?.toJson(),
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };
