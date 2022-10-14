import 'package:json_annotation/json_annotation.dart';

part 'sort.g.dart';

@JsonSerializable(explicitToJson: true)
class Sort {
  final bool? unSorted;
  final bool? sorted;
  final bool? empty;

  Sort({
    this.unSorted,
    this.sorted,
    this.empty,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);
  Map<String, dynamic> toJson() => _$SortToJson(this);
}