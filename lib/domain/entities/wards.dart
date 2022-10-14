import 'package:pindias_app/domain/entities/ward.dart';

class Wards {
  final List<Ward>? wards;
  
  Wards({this.wards,});

  factory Wards.fromJson(List<dynamic> json) {
    final Wards wards = Wards(wards: []);
    for (var element in json) {
      wards.wards!.add(Ward.fromJson(element));
    }
    return wards;
  }

  Map<String, dynamic> toJson() {
    return {
      'wards': wards?.map((e) => e.toJson()).toList(),
    };
  }
}