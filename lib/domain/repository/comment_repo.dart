import 'package:pindias_app/domain/entities/comment.dart';

abstract class CommentRepo {
  Future<Comment> create({Comment? comment});
  Future<Comment> edit({Comment? comment});
  Future<Comment> delete({Comment? comment});
}