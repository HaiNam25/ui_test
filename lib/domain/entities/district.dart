import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable(explicitToJson: true)
class District {
  final String? id;
  final String? name;
  final String? type;
  final String? slug;
  final String? nameWithType;
  final String? path;
  final String? pathWithType;
  final String? parentId;
  final String? thumbnail;

  District({
    this.id,
    this.name,
    this.type,
    this.slug,
    this.nameWithType,
    this.path,
    this.pathWithType,
    this.parentId,
    this.thumbnail,
  });

  factory District.fromJson(Map<String, dynamic> json) => _$DistrictFromJson(json);
  Map<String, dynamic> toJson() => _$DistrictToJson(this);

}
