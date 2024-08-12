import 'package:challenge_app/app/auth/components/alert.dart';
import 'package:challenge_app/app/auth/components/logo.dart';
import 'package:challenge_app/app/auth/components/text_button_link.dart';
import 'package:challenge_app/app/auth/controllers/auth_controller.dart';
import 'package:challenge_app/app/auth/utils/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatelessWidget {
  final AuthController _authController = Modular.get<AuthController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    var validate = Validate();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  height: 25,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                      const InputDecoration(labelText: 'Confirm Password'),
                ),
                const SizedBox(
                  height: 35,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: sizeOf.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!validate.password(_passwordController.text,
                          _confirmPasswordController.text)) {
                        Alert.show(
                            context, 'As senhas não conferem', Colors.red);
                        return;
                      }

                      await _authController
                          .signUp(
                            _emailController.text,
                            _passwordController.text,
                          )
                          .then((_) => Modular.to.navigate('/gate/'));
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButtonLink(
                    onTap: () => Modular.to.navigate('/auth/login'),
                    text: 'Já tem uma conta?',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
