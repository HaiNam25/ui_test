import 'package:json_annotation/json_annotation.dart';

part 'project_detail.g.dart';

@JsonSerializable()
class ProjectDetail {
  num? id;
  String? name;
  num? price;
  LocationBean? location;
  String? latitude;
  String? longitude;
  String? thumbnail;
  String? images;
  num? investorId;
  String? investorName;
  String? category;
  String? startDate;
  String? endDate;
  String? metaData;
  String? description;
  String? status;
  ProvinceBean? province;
  DistrictBean? district;
  WardBean? ward;

  ProjectDetail({this.id, this.name, this.price, this.location, this.latitude, this.longitude, this.thumbnail, this.images, this.investorId, this.investorName, this.category, this.startDate, this.endDate, this.metaData, this.description, this.status, this.province, this.district, this.ward});

  factory ProjectDetail.fromJson(Map<String, dynamic> json) => _$ProjectDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDetailToJson(this);
}

@JsonSerializable()
class WardBean {
  String? id;
  String? name;
  String? type;
  String? slug;
  String? nameWithType;
  String? path;
  String? pathWithType;
  String? parentId;

  WardBean({this.id, this.name, this.type, this.slug, this.nameWithType, this.path, this.pathWithType, this.parentId});

  factory WardBean.fromJson(Map<String, dynamic> json) => _$WardBeanFromJson(json);

  Map<String, dynamic> toJson() => _$WardBeanToJson(this);
}

@JsonSerializable()
class DistrictBean {
  String? id;
  String? name;
  String? type;
  String? slug;
  String? nameWithType;
  String? path;
  String? pathWithType;
  String? parentId;
  String? thumbnail;

  DistrictBean({this.id, this.name, this.type, this.slug, this.nameWithType, this.path, this.pathWithType, this.parentId, this.thumbnail});

  factory DistrictBean.fromJson(Map<String, dynamic> json) => _$DistrictBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictBeanToJson(this);
}

@JsonSerializable()
class ProvinceBean {
  String? id;
  String? name;
  String? slug;
  String? type;
  String? nameWithType;
  String? thumbnail;

  ProvinceBean({this.id, this.name, this.slug, this.type, this.nameWithType, this.thumbnail});

  factory ProvinceBean.fromJson(Map<String, dynamic> json) => _$ProvinceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceBeanToJson(this);
}

@JsonSerializable()
class LocationBean {
  String? country;
  String? province;
  String? district;
  String? wards;
  String? address;

  LocationBean({this.country, this.province, this.district, this.wards, this.address});

  factory LocationBean.fromJson(Map<String, dynamic> json) => _$LocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBeanToJson(this);
}

