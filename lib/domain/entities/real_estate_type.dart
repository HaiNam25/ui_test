import 'package:pindias_app/domain/entities/base_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'real_estate_type.g.dart';

@JsonSerializable(explicitToJson: true)
class RealEstateType extends BaseContent {
  final int? id;
  final String? name;
  final String? type;
  final String? status;
  RealEstateType({this.id, this.name, this.type, this.status,});

  factory RealEstateType.fromJson(Map<String, dynamic> json) => _$RealEstateTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RealEstateTypeToJson(this);

  String get getPathStatus => status != null ? '&status=$status' : '';

  String get getPathType => type != null ? "&type=$type" : '';

  String get getUri {
    String uri = '$getPathStatus$getPathType';
    return uri.replaceRange(0, 1, '');
  }
}
