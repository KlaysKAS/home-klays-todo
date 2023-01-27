import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LoginVm extends ChangeNotifier {
  String? get emailErrors => errors['email']?.join('\n');
  String? get passwordErrors => errors['pass']?.join('\n');

  String _email = '';
  String _password = '';

  final errors = <String, List<String>>{};

  void changeMail(String str) {
    _email = str;
    notifyListeners();
  }

  void changePass(String str) {
    _password = str;
    notifyListeners();
  }

  void submit() async {
    final result;
  }
}
