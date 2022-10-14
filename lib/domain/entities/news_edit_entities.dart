import 'package:json_annotation/json_annotation.dart';

part 'news_edit_entities.g.dart';

@JsonSerializable()
class NewsEditEntities {
  String? message;
  num? status;

  NewsEditEntities({this.message, this.status});

  factory NewsEditEntities.fromJson(Map<String, dynamic> json) => _$NewsEditEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$NewsEditEntitiesToJson(this);
}

