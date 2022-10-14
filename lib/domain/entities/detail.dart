import 'package:json_annotation/json_annotation.dart';

import 'contact.dart';

part 'detail.g.dart';

@JsonSerializable(explicitToJson: true)
class Detail {
  final double? usageArea;
  final double? facade;
  final double? length;
  final double? width;
  final String? condition;
  final String? description;
  final List<String>? images;
  Contact? contact;
  final String? panoramaId;
  final String? youtubeLink;
  final String? link3dview;
  final String? fullAddress;
  final String? locationDetail;
  // Null? ground;
  // Null? utilities;
  // Null? reasonsToInvest;

  Detail({
    this.usageArea,
    this.facade,
    this.length,
    this.width,
    this.condition,
    this.description,
    this.images,
    this.contact,
    this.panoramaId,
    this.youtubeLink,
    this.link3dview,
    this.fullAddress,
    this.locationDetail,
    // this.ground,
    // this.utilities,
    // this.reasonsToInvest,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
  Map<String, dynamic> toJson() => _$DetailToJson(this);

}