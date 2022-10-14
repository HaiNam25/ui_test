// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      accountId: json['accountId'] as int?,
      accountName: json['accountName'] as String?,
      content: json['content'] as String?,
      parentCommentId: json['parentCommentId'] as int?,
      postId: json['postId'] as int?,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'accountName': instance.accountName,
      'content': instance.content,
      'parentCommentId': instance.parentCommentId,
      'postId': instance.postId,
    };
