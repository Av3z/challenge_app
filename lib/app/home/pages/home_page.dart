import 'package:challenge_app/app/auth/controllers/auth_controller.dart';
import 'package:challenge_app/app/data/entities/todo.dart';
import 'package:challenge_app/app/home/pages/components/item_todo.dart';
import 'package:challenge_app/app/home/pages/components/todo_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:challenge_app/app/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Modular.get<HomeController>();
    final AuthController authController = Modular.get<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyList'),
        actions: [
          IconButton(
              onPressed: () {
                authController
                    .logout()
                    .then((_) => Modular.to.navigate('/gate/'));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return TodoModal(
                onConfirm: (title, description) {
                  final todo = Todo(
                    id: '',
                    title: title,
                    description: description,
                  );
                  homeController.addTodo(todo);
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.todos.isEmpty) {
            return const Center(child: Text('Nenhuma tarefa encontrada.'));
          }

          return ListView.builder(
            itemCount: homeController.todos.length,
            itemBuilder: (context, index) {
              final todo = homeController.todos[index];
              return ItemTodo(
                onPressed: () {
                  homeController.deleteTodo(todo.id);
                },
                onTap: () => Modular.to.navigate('/home/details', arguments: {
                  'id': todo.id,
                  'title': todo.title,
                  'description': todo.description,
                }),
                title: todo.title,
                description: todo.description,
              );
            },
          );
        },
      ),
    );
  }
}
