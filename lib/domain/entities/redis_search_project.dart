import 'package:json_annotation/json_annotation.dart';

part 'redis_search_project.g.dart';

@JsonSerializable()
class RedisSearchProject {
  num? totalResults;
  List<DocsBean>? docs;

  RedisSearchProject({this.totalResults, this.docs});

  factory RedisSearchProject.fromJson(Map<String, dynamic> json) => _$RedisSearchProjectFromJson(json);

  Map<String, dynamic> toJson() => _$RedisSearchProjectToJson(this);
}

@JsonSerializable()
class DocsBean {
  String? id;
  num? score;
  dynamic payload;
  List<PropertiesBean>? properties;

  DocsBean({this.id, this.score, this.payload, this.properties});

  factory DocsBean.fromJson(Map<String, dynamic> json) => _$DocsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DocsBeanToJson(this);
}

@JsonSerializable()
class PropertiesBean {
  String? description;

  PropertiesBean({this.description});

  factory PropertiesBean.fromJson(Map<String, dynamic> json) => _$PropertiesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PropertiesBeanToJson(this);
}

