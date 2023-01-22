import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/auth/auth_entity.dart';

class AuthenticationModel extends AuthenticationEntity {
  const AuthenticationModel({required super.userId});

  factory AuthenticationModel.fromFirebaseUser(User user) {
    return AuthenticationModel(userId: user.uid);
  }
}
