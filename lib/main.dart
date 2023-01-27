import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/appcomponent.dart';
import 'package:todo/appcomponent.jugger.dart';
import 'package:todo/login/login_page.dart';
import 'package:todo/login/login_vm.dart';

late AppComponent appComponent;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    appComponent = JuggerAppComponent.create();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider.value(
        value: LoginVm(),
        child: LoginPage(),
      ),
    );
  }
}
