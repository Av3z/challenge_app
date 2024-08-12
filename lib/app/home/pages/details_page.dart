import 'package:challenge_app/app/auth/components/logo.dart';
import 'package:challenge_app/app/data/entities/todo.dart';
import 'package:challenge_app/app/home/controllers/home_controller.dart';
import 'package:challenge_app/app/home/pages/components/todo_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final String title;
  final String description;

  const DetailsPage({
    super.key,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = Modular.get<HomeController>();
    homeController.setCurrentTodoDetails(widget.title, widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Logo(),
              const SizedBox(
                height: 35,
              ),
              Observer(
                builder: (_) => Text(
                  homeController.currentTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Observer(
                builder: (_) => Text(
                  homeController.currentDescription,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return TodoModal(
                          onConfirm: (title, description) {
                            final todo = Todo(
                              id: widget.id,
                              title: title,
                              description: description,
                            );
                            homeController.updateTodo(todo);
                            homeController.setCurrentTodoDetails(
                                title, description);
                          },
                          onCancel: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Editar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Modular.to.navigate('/home/');
                  },
                  child: const Text('Voltar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
