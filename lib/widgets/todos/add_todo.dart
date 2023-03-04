import 'package:flutter/material.dart';
import 'package:flutter_temp/models/to_do.dart';
import 'package:flutter_temp/providers/to_dos.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _form = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          TextFormField(
            controller: commentController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.description),
              label: Text('Task'),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null) {
                return 'please enter task';
              }
              if (value.isEmpty) {
                return 'Please enter task';
              }
              int minLength = 3;

              if (value.length < minLength) {
                return 'Task must be at least $minLength characters long';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('ADD TASK'),
              onPressed: () => _saveForm(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();

    try {
      final newNote = ToDo(
        id: DateTime.now().microsecondsSinceEpoch,
        value: commentController.text,
        date: DateTime.now().toString(),
      );
      // await Provider.of<ToDos>(context, listen: false).addToDo(newNote);
      Provider.of<ToDos>(context, listen: false).addToDo(newNote);

      commentController.clear();

      _showSuccessDialog();
    } catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('An unexpected error occurred'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('OKAY'),
            ),
          ],
        ),
      );
    }
  }

  void _showSuccessDialog() {
    const snackBar = SnackBar(
      content: Text('Task has been successfully added.'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
