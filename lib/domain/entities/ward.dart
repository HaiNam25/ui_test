import 'package:json_annotation/json_annotation.dart';

part 'ward.g.dart';

@JsonSerializable(explicitToJson: true)
class Ward {
  final String? id;
  final String? name;
  final String? type;
  final String? slug;
  final String? nameWithType;
  final String? path;
  final String? pathWithType;
  final String? parentId;

  Ward({
    this.id,
    this.name,
    this.type,
    this.slug,
    this.nameWithType,
    this.path,
    this.pathWithType,
    this.parentId,
  });

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);
  Map<String, dynamic> toJson() => _$WardToJson(this);

}