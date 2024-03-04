import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  String? names;
  String? email;
  String? password;

  UserModel({this.names, this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserModel copyWith({
    String? names,
    String? email,
    String? password,
  }) {
    return UserModel(
      names: names ?? this.names,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
