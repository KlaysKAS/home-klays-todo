import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jugger/jugger.dart';

@singleton
class Auth extends ChangeNotifier {
  User? _currentUser;
  final _firebaseInstance = FirebaseAuth.instance;

  @inject
  Auth() {
    _firebaseInstance.authStateChanges().listen((User? user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  Future<String> login(String email, String pass) async {
    try {
      await _firebaseInstance.signInWithEmailAndPassword(email: email, password: pass);
      return '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return 'Bad email-password pair';
      }
    }
    return 'Error, check your internet connection';
  }
}
