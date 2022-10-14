import 'package:pindias_app/domain/entities/province.dart';

class Address {
  final List<Province>? provinces;

  Address({
    this.provinces,
  });

  String findIdByName({String? name}) {
    if (name == null) return '';
    for (Province e in (provinces ?? [])) {
      if (e.name == name) return e.id ?? '';
    }
    return '';
  }

  factory Address.fromJson(List<dynamic> json) {
    final Address address = Address(provinces: []);
    for (var element in json) {
      address.provinces!.add(
        Province.fromJson(element as Map<String, dynamic>)
      );
    }
    return address;
  }

  Map<String, dynamic> toJson() {
    return {
      'provinces': provinces?.map((e) => e.toJson()).toList(),
    };
  }
}
