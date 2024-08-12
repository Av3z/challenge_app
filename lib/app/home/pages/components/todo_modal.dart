import 'package:flutter/material.dart';

class TodoModal extends StatelessWidget {
  final Function(String title, String description) onConfirm;
  final VoidCallback onCancel;

  const TodoModal({
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    return AlertDialog(
      title: const Text('Nova Tarefa'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição'),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.check),
          onPressed: () {
            final title = titleController.text;
            final description = descriptionController.text;

            if (title.isNotEmpty && description.isNotEmpty) {
              onConfirm(title, description);
              Navigator.of(context).pop();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onCancel,
        ),
      ],
    );
  }
}
