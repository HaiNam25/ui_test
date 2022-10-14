// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
      unSorted: json['unSorted'] as bool?,
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
      'unSorted': instance.unSorted,
      'sorted': instance.sorted,
      'empty': instance.empty,
    };
