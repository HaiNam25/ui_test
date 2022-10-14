import 'package:json_annotation/json_annotation.dart';

part 'redis_search_project_detail.g.dart';

@JsonSerializable()
class RedisSearchProjectDetail {
  String? id;
  num? score;
  dynamic payload;
  List<PropertiesBean>? properties;

  RedisSearchProjectDetail({this.id, this.score, this.payload, this.properties});

  factory RedisSearchProjectDetail.fromJson(Map<String, dynamic> json) => _$RedisSearchProjectDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RedisSearchProjectDetailToJson(this);
}

@JsonSerializable()
class PropertiesBean {
  dynamic description;

  PropertiesBean({this.description});

  factory PropertiesBean.fromJson(Map<String, dynamic> json) => _$PropertiesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesBeanToJson(this);
}

