import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? name;
  final String? cargo;
  final double? latitude;
  final double? longitude;
  final double? age;
  final String? email;

  User({this.name, this.cargo, this.latitude, this.longitude, this.age, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
