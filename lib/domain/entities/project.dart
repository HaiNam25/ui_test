import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class project {
  List<ContentBean>? content;
  PageableBean? pageable;
  num? totalElements;
  bool? last;
  num? totalPages;
  bool? first;
  SortBean? sort;
  num? size;
  num? number;
  num? numberOfElements;
  bool? empty;

  project(
      {this.content,
      this.pageable,
      this.totalElements,
      this.last,
      this.totalPages,
      this.first,
      this.sort,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty});

  factory project.fromJson(Map<String, dynamic> json) =>
      _$projectFromJson(json);

  Map<String, dynamic> toJson() => _$projectToJson(this);
}

@JsonSerializable()
class PageableBean {
  SortBean? sort;
  num? pageNumber;
  num? pageSize;
  num? offset;
  bool? paged;
  bool? unpaged;

  PageableBean(
      {this.sort,
      this.pageNumber,
      this.pageSize,
      this.offset,
      this.paged,
      this.unpaged});

  factory PageableBean.fromJson(Map<String, dynamic> json) =>
      _$PageableBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PageableBeanToJson(this);
}

@JsonSerializable()
class SortBean {
  bool? unsorted;
  bool? sorted;
  bool? empty;

  SortBean({this.unsorted, this.sorted, this.empty});

  factory SortBean.fromJson(Map<String, dynamic> json) =>
      _$SortBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SortBeanToJson(this);
}

@JsonSerializable()
class ContentBean {
  num? id;
  String? name;
  num? price;
  dynamic location;
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

  ContentBean({
    this.id,
    this.name,
    this.price,
    this.location,
    this.latitude,
    this.longitude,
    this.thumbnail,
    this.images,
    this.investorId,
    this.investorName,
    this.category,
    this.startDate,
    this.endDate,
    this.metaData,
    this.description,
    this.status,
    this.province,
  });

  factory ContentBean.fromJson(Map<String, dynamic> json) =>
      _$ContentBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ContentBeanToJson(this);
}

@JsonSerializable()
class ProvinceBean {
  String? id;
  String? name;
  String? slug;
  String? type;
  String? nameWithType;
  String? thumbnail;

  ProvinceBean(
      {this.id,
      this.name,
      this.slug,
      this.type,
      this.nameWithType,
      this.thumbnail});

  factory ProvinceBean.fromJson(Map<String, dynamic> json) =>
      _$ProvinceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceBeanToJson(this);
}
