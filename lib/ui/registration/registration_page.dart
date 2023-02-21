import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/ui/registration/registration_steps/email_input/email_input_page.dart';
import 'package:todo/ui/registration/registration_steps/email_input/email_input_vm.dart';

const String _registrationHome = "/registration/";
const String _registrationStart = "/registration/$_emailSetUpRoute";
const String _emailSetUpRoute = "email";
const String _extraCredentials = "extras";
const String _finishRegistration = "finish";

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Scaffold(
        appBar: _buildFlowAppBar(),
        body: Navigator(
          key: _navKey,
          initialRoute: _registrationStart,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget page = Container();
    final name = settings.name!.substring(_registrationHome.length);
    switch (name) {
      case _emailSetUpRoute:
        page = ChangeNotifierProvider.value(
          value: EmailInputVm(),
          child: const EmailInputPage(),
        );
        break;
      case _extraCredentials:
        page = Container();
        break;
      case _finishRegistration:
        page = Container();
        break;
      default:
        page = const Center(
          child: CircularProgressIndicator(),
        );
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) => page,
      settings: settings,
    );
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _onExitPressed,
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text("Регистрация"),
    );
  }

  void _onEmailPrinted() {
    _navKey.currentState!.pushNamed(_extraCredentials);
  }

  void _onExtrasPrinted() {
    _navKey.currentState!.pushNamed(_finishRegistration);
  }

  void _exitRegister() {
    Navigator.of(context).pop();
  }

  void _onExitPressed() async {
    final isConfirmed = await _isExitDesired();
    if (isConfirmed && mounted) {
      _exitRegister();
    }
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Вы точно хотите прервать регистрацию?'),
                content: const Text('Если вы прервете процесс регистрации ваши '
                    'данные будут удалены из системы.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Выйти'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Продолжить'),
                  ),
                ],
              );
            }) ??
        false;
  }
}
