import 'coordinates_ggmap.dart';
import 'package:json_annotation/json_annotation.dart';

part 'path_curve.g.dart';

@JsonSerializable(explicitToJson: true)
class PathCurve {
  final List<CoordinatesGoogleMap>? paths;
  PathCurve({this.paths});

  factory PathCurve.fromJson(Map<String, dynamic> json) => _$PathCurveFromJson(json);
  Map<String, dynamic> toJson() => _$PathCurveToJson(this);

  @override
  String toString() {
    return '{paths: $paths}';
  }
}