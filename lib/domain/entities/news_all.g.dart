// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelTest _$ModelTestFromJson(Map<String, dynamic> json) => ModelTest(
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ContentBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalElements: (json['totalElements'] as num?)?.toDouble(),
      last: json['last'] as bool?,
      totalPages: json['totalPages'] as int?,
      first: json['first'] as bool?,
      size: json['size'] as int?,
      number: json['number'] as int?,
      numberOfElements: json['numberOfElements'] as int?,
      empty: json['empty'] as bool?,
    );

Map<String, dynamic> _$ModelTestToJson(ModelTest instance) => <String, dynamic>{
      'content': instance.content,
      'totalElements': instance.totalElements,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

ContentBean _$ContentBeanFromJson(Map<String, dynamic> json) => ContentBean(
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

Map<String, dynamic> _$ContentBeanToJson(ContentBean instance) =>
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
