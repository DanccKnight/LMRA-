// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    uid: json['uid'] as String,
    email: json['email'] as String,
    profileImage: json['profileImage'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'token': instance.token,
    };
