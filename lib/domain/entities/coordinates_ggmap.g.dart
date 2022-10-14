// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_ggmap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesGoogleMap _$CoordinatesGoogleMapFromJson(
        Map<String, dynamic> json) =>
    CoordinatesGoogleMap(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesGoogleMapToJson(
        CoordinatesGoogleMap instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
