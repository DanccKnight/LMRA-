import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  String name;
  String uid;
  String email;
  String profileImage;
  String token;

  User({this.name, this.uid, this.email, this.profileImage, this.token});

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
