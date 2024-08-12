import 'package:challenge_app/app/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Modular.get<AuthController>();

    authController.isAuth
        ? Modular.to.navigate('/home/')
        : Modular.to.navigate('/auth/login');

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
