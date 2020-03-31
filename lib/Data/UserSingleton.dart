import 'User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSingleton {
  UserSingleton._internal();

  static final UserSingleton _user = UserSingleton._internal();
  FirebaseUser fireUser;
  User user = User();

  factory UserSingleton() {
    return _user;
  }
}
