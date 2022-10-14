import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  final int? accountId;
  final String? accountName;
  final String? content;
  final int? parentCommentId;
  final int? postId;

  Comment({
    this.accountId,
    this.accountName,
    this.content,
    this.parentCommentId,
    this.postId,
  });
}
