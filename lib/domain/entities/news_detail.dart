import 'package:json_annotation/json_annotation.dart';

part 'news_detail.g.dart';

@JsonSerializable()
class NewsDetail {
  num? id;
  String? authorName;
  num? authorId;
  String? title;
  String? subtitle;
  String? slug;
  String? content;
  String? thumbnail;
  String? seoTitle;
  String? seoDescription;
  String? seoKeyword;
  String? categoryName;
  String? status;

  NewsDetail({this.id, this.authorName, this.authorId, this.title, this.subtitle, this.slug, this.content, this.thumbnail, this.seoTitle, this.seoDescription, this.seoKeyword, this.categoryName, this.status});

  factory NewsDetail.fromJson(Map<String, dynamic> json) => _$NewsDetailFromJson(json);

  Map<String?, dynamic> toJson() => _$NewsDetailToJson(this);
}

