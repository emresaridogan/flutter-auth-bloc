import 'package:authentication_bloc/features/data/models/user/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exception.dart';

abstract class AuthenticationService {
  AuthenticationModel getCurrentUser();

  Future<AuthenticationModel> signUp(String email, password);

  Future<AuthenticationModel> signIn(String email, password);

  Future<bool> signOut();
}

class AuthenticationServiceImpl extends AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  AuthenticationModel getCurrentUser() {
    return _getCurrentUser();
  }

  @override
  Future<AuthenticationModel> signUp(String email, password) {
    return _signUp(email, password);
  }

  @override
  Future<AuthenticationModel> signIn(String email, password) {
    return _signIn(email, password);
  }

  @override
  Future<bool> signOut() {
    return _signOut();
  }

  AuthenticationModel _getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return AuthenticationModel.fromFirebaseUser(user);
    } else {
      throw AuthenticationException();
    }
  }

  Future<AuthenticationModel> _signUp(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return AuthenticationModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw AuthenticationException();
      }
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<AuthenticationModel> _signIn(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return AuthenticationModel.fromFirebaseUser(userCredential.user!);
      } else {
        throw AuthenticationException();
      }
    } catch (e) {
      throw AuthenticationException();
    }
  }

  Future<bool> _signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      throw AuthenticationException();
    }
  }
}
