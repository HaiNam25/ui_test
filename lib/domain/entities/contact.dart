import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable(explicitToJson: true)
class Contact {
  final String? name;
  final String? email;
  final String? province;
  final String? mobile;

  Contact({
    this.name,
    this.email,
    this.province,
    this.mobile,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);

}