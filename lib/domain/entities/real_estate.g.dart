// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealEstate _$RealEstateFromJson(Map<String, dynamic> json) => RealEstate(
      id: json['id'] as int?,
      accountId: json['accountId'] as int?,
      name: json['name'] as String?,
      categoryName: json['categoryName'] as String?,
      projectId: json['projectId'] as int?,
      projectName: json['projectName'] as String?,
      postType: json['postType'] as String?,
      purpose: json['purpose'] as String?,
      direction: json['direction'] as String?,
      baths: json['baths'] as int?,
      beds: json['beds'] as int?,
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      area: (json['area'] as num?)?.toDouble(),
      areaUnit: json['areaUnit'] as String?,
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : Ward.fromJson(json['ward'] as Map<String, dynamic>),
      location: json['location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      thumbnail: json['thumbnail'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      source: json['source'] as String?,
      juridical: json['juridical'] as String?,
      view: json['view'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$RealEstateToJson(RealEstate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'categoryName': instance.categoryName,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'postType': instance.postType,
      'purpose': instance.purpose,
      'direction': instance.direction,
      'baths': instance.baths,
      'beds': instance.beds,
      'detail': instance.detail?.toJson(),
      'price': instance.price,
      'currency': instance.currency,
      'area': instance.area,
      'areaUnit': instance.areaUnit,
      'province': instance.province?.toJson(),
      'district': instance.district?.toJson(),
      'ward': instance.ward?.toJson(),
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'thumbnail': instance.thumbnail,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'source': instance.source,
      'juridical': instance.juridical,
      'view': instance.view,
      'status': instance.status,
    };
