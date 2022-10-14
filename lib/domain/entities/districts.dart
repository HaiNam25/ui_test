import 'package:pindias_app/domain/entities/district.dart';

class Districts {
  final List<District>? districts;

  Districts({this.districts});

  factory Districts.fromJson(List<dynamic> json) {
    final Districts districts = Districts(districts: []);
    for (var element in json) {
      districts.districts!.add(
        District.fromJson(element as Map<String, dynamic>),
      );
    }

    return districts;
  }

  Map<String, dynamic> toJson() {
    return {
      'districts': districts?.map((e) => e.toJson()).toList(),
    };
  }
}