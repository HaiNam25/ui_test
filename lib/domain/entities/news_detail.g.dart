// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) => NewsDetail(
      id: json['id'] as num?,
      authorName: json['authorName'] as String?,
      authorId: json['authorId'] as num?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      slug: json['slug'] as String?,
      content: json['content'] as String?,
      thumbnail: json['thumbnail'] as String?,
      seoTitle: json['seoTitle'] as String?,
      seoDescription: json['seoDescription'] as String?,
      seoKeyword: json['seoKeyword'] as String?,
      categoryName: json['categoryName'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorName': instance.authorName,
      'authorId': instance.authorId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'slug': instance.slug,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
      'seoTitle': instance.seoTitle,
      'seoDescription': instance.seoDescription,
      'seoKeyword': instance.seoKeyword,
      'categoryName': instance.categoryName,
      'status': instance.status,
    };
