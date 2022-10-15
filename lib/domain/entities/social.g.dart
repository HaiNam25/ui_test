// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Social _$SocialFromJson(Map<String, dynamic> json) => Social(
      id: json['id'] as int?,
      authorId: json['authorId'] as int?,
      authorName: json['authorName'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      thumbnail: json['thumbnail'] as String?,
      status: json['status'] as String?,
      categoryName: json['categoryName'] as String?,
      categoryId: json['categoryId'] as int?,
      postLike: json['postLike'] as int?,
      view: json['view'] as int?,
      totalComment: json['totalComment'] as int?,
      totalSavePost: json['totalSavePost'] as int?,
      minutesPost: json['minutesPost'] as int?,
      hourPost: json['hourPost'] as int?,
      dayPost: json['dayPost'] as int?,
      monthPost: json['monthPost'] as int?,
      listHashTag: json['listHashTag'],
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SocialToJson(Social instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'thumbnail': instance.thumbnail,
      'status': instance.status,
      'categoryName': instance.categoryName,
      'categoryId': instance.categoryId,
      'postLike': instance.postLike,
      'view': instance.view,
      'totalComment': instance.totalComment,
      'totalSavePost': instance.totalSavePost,
      'minutesPost': instance.minutesPost,
      'hourPost': instance.hourPost,
      'dayPost': instance.dayPost,
      'monthPost': instance.monthPost,
      'listHashTag': instance.listHashTag,
      'createdAt': instance.createdAt,
    };
