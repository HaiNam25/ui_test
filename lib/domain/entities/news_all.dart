import 'package:json_annotation/json_annotation.dart';

part 'news_all.g.dart';

@JsonSerializable()
class ModelTest {
  final List<ContentBean>? content;
  final double? totalElements;
  final bool? last;
  final int? totalPages;
  final bool? first;
  final int? size;
  final int? number;
  final int? numberOfElements;
  final bool? empty;

  ModelTest(
      {this.content,
      this.totalElements,
      this.last,
      this.totalPages,
      this.first,
      this.size,
      this.number,
      this.numberOfElements,
      this.empty});

  factory ModelTest.fromJson(Map<String, dynamic> json) =>
      _$ModelTestFromJson(json);

  Map<String, dynamic> toJson() => _$ModelTestToJson(this);
}

@JsonSerializable()
class ContentBean {
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

  ContentBean(
      {this.id,
      this.authorName,
      this.authorId,
      this.title,
      this.subtitle,
      this.slug,
      this.content,
      this.thumbnail,
      this.seoTitle,
      this.seoDescription,
      this.seoKeyword,
      this.categoryName,
      this.status});

  factory ContentBean.fromJson(Map<String, dynamic> json) =>
      _$ContentBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ContentBeanToJson(this);
}
