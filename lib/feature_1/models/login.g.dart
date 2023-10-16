// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      user_name: json['user_name'] as String?,
      password: json['password'] as String?,
      deviceID: json['deviceID'] as String?,
      deviceType: json['deviceType'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'user_name': instance.user_name,
      'password': instance.password,
      'deviceType': instance.deviceType,
      'deviceID': instance.deviceID,
    };
