import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/auth_module/auth.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/main.dart';

class WrapperVm extends ChangeNotifier {
  late final Auth _authModule;
  bool _firebaseAppInited = false;

  bool get isUserLoggedIn => _authModule.isLoggedIn;

  bool get firebaseAppInited => _firebaseAppInited;

  WrapperVm() {
    _init();
  }

  Future<void> _init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _firebaseAppInited = true;
    _authModule = appComponent.autentificator();
    _authModule.addListener(_authCallback);
    notifyListeners();
  }

  void _authCallback() {
    notifyListeners();
  }

  @override
  void dispose() {
    _authModule.removeListener(_authCallback);
    super.dispose();
  }
}
