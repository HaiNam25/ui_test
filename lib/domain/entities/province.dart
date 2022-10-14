import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable(explicitToJson: true)
class Province {
  final String? id;
  final String? name;
  final String? slug;
  final String? type;
  final String? nameWithType;
  final String? thumbnail;

  Province({
    this.id,
    this.name,
    this.slug,
    this.type,
    this.nameWithType,
    this.thumbnail,
  });

  factory Province.fromJson(Map<String, dynamic> json) => _$ProvinceFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

}