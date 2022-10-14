import 'package:pindias_app/domain/entities/sort.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pageable.g.dart';

@JsonSerializable(explicitToJson: true)
class Pageable {
  final Sort? sort;
  final int? pageNumber;
  final int? pageSize;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  Pageable(
      {this.sort,
        this.pageNumber,
        this.pageSize,
        this.offset,
        this.paged,
        this.unpaged,});
  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);
  Map<String, dynamic> toJson() => _$PageableToJson(this);
}