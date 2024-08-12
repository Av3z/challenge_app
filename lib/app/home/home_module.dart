import 'package:challenge_app/app/auth/auth_module.dart';
import 'package:challenge_app/app/cores/auth_gate_module.dart';
import 'package:challenge_app/app/data/data_module.dart';
import 'package:challenge_app/app/data/interface/data_service.dart';
import 'package:challenge_app/app/home/controllers/home_controller.dart';
import 'package:challenge_app/app/home/pages/details_page.dart';
import 'package:challenge_app/app/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [DataModule(), AuthModule(), AuthGateModule()];

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage());
    r.child(
      '/details',
      child: (context) => DetailsPage(
        id: Modular.args.data['id'],
        title: Modular.args.data['title'],
        description: Modular.args.data['description'],
      ),
    );
  }

  @override
  void binds(Injector i) {
    i.addSingleton<HomeController>(
        () => HomeController(i.get<DataService>(), i.get<FirebaseAuth>()));
  }
}
