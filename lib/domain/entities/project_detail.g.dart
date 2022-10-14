// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetail _$ProjectDetailFromJson(Map<String, dynamic> json) =>
    ProjectDetail(
      id: json['id'] as num?,
      name: json['name'] as String?,
      price: json['price'] as num?,
      location: json['location'] == null
          ? null
          : LocationBean.fromJson(json['location'] as Map<String, dynamic>),
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images: json['images'] as String?,
      investorId: json['investorId'] as num?,
      investorName: json['investorName'] as String?,
      category: json['category'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      metaData: json['metaData'] as String?,
      description: json['description'] as String?,
      status: json['status'] as String?,
      province: json['province'] == null
          ? null
          : ProvinceBean.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : DistrictBean.fromJson(json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : WardBean.fromJson(json['ward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDetailToJson(ProjectDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
      'investorId': instance.investorId,
      'investorName': instance.investorName,
      'category': instance.category,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'metaData': instance.metaData,
      'description': instance.description,
      'status': instance.status,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
    };

WardBean _$WardBeanFromJson(Map<String, dynamic> json) => WardBean(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      slug: json['slug'] as String?,
      nameWithType: json['nameWithType'] as String?,
      path: json['path'] as String?,
      pathWithType: json['pathWithType'] as String?,
      parentId: json['parentId'] as String?,
    );

Map<String, dynamic> _$WardBeanToJson(WardBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'slug': instance.slug,
      'nameWithType': instance.nameWithType,
      'path': instance.path,
      'pathWithType': instance.pathWithType,
      'parentId': instance.parentId,
    };

DistrictBean _$DistrictBeanFromJson(Map<String, dynamic> json) => DistrictBean(
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      slug: json['slug'] as String?,
      nameWithType: json['nameWithType'] as String?,
      path: json['path'] as String?,
      pathWithType: json['pathWithType'] as String?,
      parentId: json['parentId'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$DistrictBeanToJson(DistrictBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'slug': instance.slug,
      'nameWithType': instance.nameWithType,
      'path': instance.path,
      'pathWithType': instance.pathWithType,
      'parentId': instance.parentId,
      'thumbnail': instance.thumbnail,
    };

ProvinceBean _$ProvinceBeanFromJson(Map<String, dynamic> json) => ProvinceBean(
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      type: json['type'] as String?,
      nameWithType: json['nameWithType'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProvinceBeanToJson(ProvinceBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'nameWithType': instance.nameWithType,
      'thumbnail': instance.thumbnail,
    };

LocationBean _$LocationBeanFromJson(Map<String, dynamic> json) => LocationBean(
      country: json['country'] as String?,
      province: json['province'] as String?,
      district: json['district'] as String?,
      wards: json['wards'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationBeanToJson(LocationBean instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'district': instance.district,
      'wards': instance.wards,
      'address': instance.address,
    };
