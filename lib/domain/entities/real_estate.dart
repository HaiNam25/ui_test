import 'package:pindias_app/domain/entities/base_object.dart';
import 'package:pindias_app/domain/entities/province.dart';
import 'package:pindias_app/domain/entities/ward.dart';
import 'package:json_annotation/json_annotation.dart';

import 'detail.dart';
import 'district.dart';

part 'real_estate.g.dart';

@JsonSerializable(explicitToJson: true)
class RealEstate extends BaseContent {
  final int? id;
  final int? accountId;
  final String? name;
  final String? categoryName;
  final int? projectId;
  final String? projectName;
  final String? postType;
  final String? purpose;
  final String? direction;
  final int? baths;
  final int? beds;
  final Detail? detail;
  final double? price;
  final String? currency;
  final double? area;
  final String? areaUnit;
  final Province? province;
  final District? district;
  final Ward? ward;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? thumbnail;
  final String? startDate;
  final String? endDate;
  final String? source;
  final String? juridical;
  final int? view;
  final String? status;
  //Null? isBot;

  RealEstate({
    this.id,
    this.accountId,
    this.name,
    this.categoryName,
    this.projectId,
    this.projectName,
    this.postType,
    this.purpose,
    this.direction,
    this.baths,
    this.beds,
    this.detail,
    this.price,
    this.currency,
    this.area,
    this.areaUnit,
    this.province,
    this.district,
    this.ward,
    this.location,
    this.latitude,
    this.longitude,
    this.thumbnail,
    this.startDate,
    this.endDate,
    this.source,
    this.juridical,
    this.view,
    this.status,
    //this.isBot,
  });

  bool get isHasId => id != null;
  bool get isHasLatitude => latitude != null;
  bool get isHasLongitude => longitude != null;


  double get getLatitude {
    if (isHasLatitude) {
      return double.tryParse(latitude!) ?? 0.0;
    }
    return 0.0;
  }

  double get getLongitude  {
    if (isHasLongitude ) {
      return double.tryParse(longitude!) ?? 0.0;
    }
    return 0.0;
  }

  bool get isCanCreateLatLng => isHasLatitude && isHasLongitude;

  factory RealEstate.fromJson(Map<String, dynamic> json) => _$RealEstateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RealEstateToJson(this);

}