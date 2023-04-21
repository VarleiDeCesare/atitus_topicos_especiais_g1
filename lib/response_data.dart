import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class User {
  String name;
  String cargo;
  double latitude;
  double longitude;
  final double? age;
  final String? email;

  User({
    required this.name,
    required this.cargo,
    required this.latitude,
    required this.longitude,
    this.age,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ResponseData {
  int code;
  dynamic meta;
  List<User> data;
  ResponseData({required this.code, required this.meta, required this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
