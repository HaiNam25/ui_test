import 'package:json_annotation/json_annotation.dart';

part 'coordinates_ggmap.g.dart';

@JsonSerializable(explicitToJson: true)
class CoordinatesGoogleMap {
  final double? lat;
  final double? lng;

  CoordinatesGoogleMap({this.lat, this.lng});

  factory CoordinatesGoogleMap.fromJson(Map<String, dynamic> json) => _$CoordinatesGoogleMapFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesGoogleMapToJson(this);

  @override
  String toString() {
    return '{"lat": $lat, "lng": $lng}';
  }
}