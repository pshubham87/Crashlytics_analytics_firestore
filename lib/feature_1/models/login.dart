// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(explicitToJson: true)
class Login {
  final String? user_name;
  final String? password;
  final String? deviceType;
  final String? deviceID;

  Login({this.user_name, this.password, this.deviceID, this.deviceType});

  const Login.named(
      {this.user_name, this.password, this.deviceType, this.deviceID});

  Login copyWith(
          {String? user_name,
          String? password,
          String? deviceType,
          String? deviceID}) =>
      Login.named(
        user_name: user_name ?? this.user_name,
        password: password ?? this.password,
        deviceType: deviceType ?? this.deviceType,
        deviceID: deviceID ?? this.deviceID,
      );

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  factory Login.fromJson(json) => _$LoginFromJson(json);
}
