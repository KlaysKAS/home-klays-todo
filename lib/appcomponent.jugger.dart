// ignore_for_file: implementation_imports
// ignore_for_file: prefer_const_constructors
// ignore_for_file: always_specify_types
// ignore_for_file: directives_ordering
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: type=lint
// ignore_for_file: unused_field
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:todo/auth_module/auth.dart' as _i1;
import 'package:todo/appcomponent.dart' as _i2;
import 'package:jugger/jugger.dart' as _i3;

class JuggerAppComponent implements _i2.AppComponent {
  JuggerAppComponent.create();

  late final _i3.IProvider<_i1.Auth> _authProvider =
      _i3.SingletonProvider<_i1.Auth>(() => _i1.Auth());

  @override
  _i1.Auth autentificator() => _authProvider.get();
}
