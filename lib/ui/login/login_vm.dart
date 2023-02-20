import 'package:flutter/foundation.dart';
import 'package:todo/main.dart';

class LoginVm extends ChangeNotifier {
  final _auth = appComponent.autentificator();

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
    final result = await _auth.login(_email, _password);
    if (result.isNotEmpty) errors['email'] = [result]; // TODO(Kirill): test
    notifyListeners();
  }
}
