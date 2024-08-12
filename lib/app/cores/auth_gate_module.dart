import 'package:challenge_app/app/cores/pages/auth_gate.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGateModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const AuthGate());
  }
}
