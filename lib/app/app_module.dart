import 'package:challenge_app/app/auth/auth_module.dart';
import 'package:challenge_app/app/cores/auth_gate_module.dart';
import 'package:challenge_app/app/cores/pages/auth_gate.dart';
import 'package:challenge_app/app/data/data_module.dart';
import 'package:challenge_app/app/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule(), HomeModule(), DataModule()];

  @override
  void routes(RouteManager r) {
    r.module('/auth', module: AuthModule());
    r.module('/gate', module: AuthGateModule());
    r.module('/home', module: HomeModule());
    r.module('/data', module: DataModule());
    r.child(
      '/',
      child: (_) => const AuthGate(),
    );
  }
}
