import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/login/login_vm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: _loginForm(context),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final vm = context.watch<LoginVm>();
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: 'example@gmail.com',
                hintStyle: const TextStyle(color: Color(0x66000000)),
                label: const Text("Email"),
                labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 12),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.blueAccent,
                )),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorMaxLines: 2,
                errorText: vm.emailErrors),
            keyboardType: TextInputType.emailAddress,
            onChanged: vm.changeMail,
          ),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
                hintText: 'qwerty123',
                hintStyle: const TextStyle(color: Color(0x66000000)),
                label: const Text("Password"),
                labelStyle: const TextStyle(color: Colors.blueAccent, fontSize: 12),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.blueAccent,
                )),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorMaxLines: 2,
                errorText: vm.emailErrors),
            keyboardType: TextInputType.text,
            autocorrect: false,
            obscureText: true,
            onChanged: vm.changePass,
          ),
          const SizedBox(height: 4),
          ElevatedButton(onPressed: vm.submit, child: const Text("login")),
        ],
      ),
    );
  }
}
