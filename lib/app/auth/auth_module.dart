import 'package:challenge_app/app/auth/controllers/auth_controller.dart';
import 'package:challenge_app/app/auth/interfaces/auth_service.dart';
import 'package:challenge_app/app/auth/pages/login_page.dart';
import 'package:challenge_app/app/auth/pages/register_page.dart';
import 'package:challenge_app/app/auth/services/firebase_auth_service.dart';
import 'package:challenge_app/app/cores/auth_gate_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [AuthGateModule()];

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (context) => LoginPage());
    r.child('/register', child: (context) => RegisterPage());
  }

  @override
  void exportedBinds(Injector i) {
    i.addSingleton<AuthController>(AuthController.new);
    i.addInstance<FirebaseAuth>(FirebaseAuth.instance);
    i.add<AuthService>(() => FirebaseAuthService(i.get<FirebaseAuth>()));
  }
}
