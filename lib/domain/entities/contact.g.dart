// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      name: json['name'] as String?,
      email: json['email'] as String?,
      province: json['province'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'province': instance.province,
      'mobile': instance.mobile,
    };
