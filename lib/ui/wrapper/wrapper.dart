import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/home/home_page.dart';
import 'package:todo/ui/loading_page.dart';
import 'package:todo/ui/login/login_page.dart';
import 'package:todo/ui/login/login_vm.dart';
import 'package:todo/ui/wrapper/wrapper_vm.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  // Should return one of [Home, Login]
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<WrapperVm>();
    if (!vm.firebaseAppInited) {
      return const LoadingPage(
        loadingMessage: "Приложение грузится",
        messageColor: Colors.black,
      );
    }

    if (vm.isUserLoggedIn) {
      return HomePage();
      // return ChangeNotifierProvider.value(
      //   value: HomeVm(),
      //   child: HomePage(),
      // ); // Todo(Kirill): do it after add home vm
    }
    return ChangeNotifierProvider.value(
      value: LoginVm(),
      child: LoginPage(),
    );
  }
}
