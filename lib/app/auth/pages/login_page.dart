import 'package:challenge_app/app/auth/components/logo.dart';
import 'package:challenge_app/app/auth/components/text_button_link.dart';
import 'package:challenge_app/app/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Modular.get<AuthController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Logo(),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(
                height: 35,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: sizeOf.width,
                child: ElevatedButton(
                  onPressed: () async {
                    await _authController
                        .signIn(
                          _emailController.text,
                          _passwordController.text,
                        )
                        .then((_) => Modular.to.navigate('/gate/'));
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButtonLink(
                  onTap: () => Modular.to.navigate('/auth/register'),
                  text: 'Não tem conta?',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
