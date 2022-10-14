import 'package:json_annotation/json_annotation.dart';

part 'investor.g.dart';

@JsonSerializable(explicitToJson: true)
class Investor {
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? createdBy;
  final int? updatedBy;
  final int? deletedBy;
  final int? id;
  final String? name;
  final String? location;
  final String? website;
  final String? phone;
  final String? thumbnail;
  final String? description;
  final int? charteredCapital;
  final String? createdYear;
  final String? field;
  final String? status;

  Investor({
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.id,
    this.name,
    this.location,
    this.website,
    this.phone,
    this.thumbnail,
    this.description,
    this.charteredCapital,
    this.createdYear,
    this.field,
    this.status,
  });
}
