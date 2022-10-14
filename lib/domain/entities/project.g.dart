// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

project _$projectFromJson(Map<String, dynamic> json) => project(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ContentBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: json['pageable'] == null
          ? null
          : PageableBean.fromJson(json['pageable'] as Map<String, dynamic>),
      totalElements: json['totalElements'] as num?,
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as num?,
      first: json['first'] as bool?,
      sort: json['sort'] == null
          ? null
          : SortBean.fromJson(json['sort'] as Map<String, dynamic>),
      size: json['size'] as num?,
      number: json['number'] as num?,
      numberOfElements: json['numberOfElements'] as num?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$projectToJson(project instance) => <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'first': instance.first,
      'sort': instance.sort,
      'size': instance.size,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

PageableBean _$PageableBeanFromJson(Map<String, dynamic> json) => PageableBean(
      sort: json['sort'] == null
          ? null
          : SortBean.fromJson(json['sort'] as Map<String, dynamic>),
      pageNumber: json['pageNumber'] as num?,
      pageSize: json['pageSize'] as num?,
      offset: json['offset'] as num?,
      paged: json['paged'] as bool?,
      unpaged: json['unpaged'] as bool?,
    );

Map<String, dynamic> _$PageableBeanToJson(PageableBean instance) =>
    <String, dynamic>{
      'sort': instance.sort,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

SortBean _$SortBeanFromJson(Map<String, dynamic> json) => SortBean(
      unsorted: json['unsorted'] as bool?,
      sorted: json['sorted'] as bool?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$SortBeanToJson(SortBean instance) => <String, dynamic>{
      'unsorted': instance.unsorted,
      'sorted': instance.sorted,
      'empty': instance.empty,
    };

ContentBean _$ContentBeanFromJson(Map<String, dynamic> json) => ContentBean(
      id: json['id'] as num?,
      name: json['name'] as String?,
      price: json['price'] as num?,
      location: json['location'],
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
    );

Map<String, dynamic> _$ContentBeanToJson(ContentBean instance) =>
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
