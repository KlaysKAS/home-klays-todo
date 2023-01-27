import 'package:jugger/jugger.dart';
import 'package:todo/auth_module/auth.dart';

@singleton
@Component()
abstract class AppComponent {
  Auth autentificator();
}
