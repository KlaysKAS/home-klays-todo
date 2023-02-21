import 'package:flutter/material.dart';

class EmailInputVm extends ChangeNotifier {
  static const _emailErrors = "email";
  static const _passErrors = "pass";
  static const _repeatPassErrors = "repeatPass";

  final _errors = <String, String>{};

  final _emailRegExp = RegExp("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$");
  final _passRegExp =
      RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d\\w\\W]{8,}\$");

  String _email = "";
  String _password = "";
  String _repeatPassword = "";

  String? get emailErrors => _errors[_emailErrors];

  String? get passwordErrors => _errors[_passErrors];

  String? get passwordRepeatErrors => _errors[_repeatPassErrors];

  String get email => _email;

  String get password => _password;

  String get repeatPassword => _repeatPassword;

  void changeMail(String value) {
    _email = value;
    if (_email.isNotEmpty && !_emailRegExp.hasMatch(_email)) {
      _errors[_emailErrors] = "Неправильная почта";
    } else {
      _errors.remove(_emailErrors);
    }
    notifyListeners();
  }

  void changePass(String value) {
    _password = value;
    if (_password.isNotEmpty && !_passRegExp.hasMatch(_password)) {
      _errors[_passErrors] = "Пароль должен быть длинее 8 символов, "
          "содержать как минимум 1 буквенный символ каждого из регистров и "
          "1 цифру";
    } else {
      _errors.remove(_passErrors);
    }
    notifyListeners();
  }

  void changeRepeatPass(String value) {
    _repeatPassword = value;
    if (_repeatPassword.isNotEmpty && _password != _repeatPassword) {
      _errors[_repeatPassErrors] = "Пароли не совпадают";
    } else {
      _errors.remove(_repeatPassErrors);
    }
    notifyListeners();
  }

  void submit() {
    print(_email);
    print(password);
    print(repeatPassword);
  }
}
