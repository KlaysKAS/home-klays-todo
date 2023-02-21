import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_input_vm.dart';

class EmailInputPage extends StatelessWidget {
  const EmailInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: _inputForm(context),
    );
  }

  Widget _inputForm(BuildContext context) {
    final vm = context.watch<EmailInputVm>();
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
              labelStyle:
                  const TextStyle(color: Colors.blueAccent, fontSize: 12),
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
              errorText: vm.emailErrors,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: vm.changeMail,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'qwerty123',
              hintStyle: const TextStyle(color: Color(0x66000000)),
              label: const Text("Password"),
              labelStyle:
                  const TextStyle(color: Colors.blueAccent, fontSize: 12),
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
              errorText: vm.passwordErrors,
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            obscureText: true,
            onChanged: vm.changePass,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'qwerty123',
              hintStyle: const TextStyle(color: Color(0x66000000)),
              label: const Text("Repeat password"),
              labelStyle:
                  const TextStyle(color: Colors.blueAccent, fontSize: 12),
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
              errorText: vm.passwordRepeatErrors,
            ),
            keyboardType: TextInputType.text,
            autocorrect: false,
            obscureText: true,
            onChanged: vm.changeRepeatPass,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: vm.submit,
            child: const Text("Зарегистрироваться"),
          ),
        ],
      ),
    );
  }
}
