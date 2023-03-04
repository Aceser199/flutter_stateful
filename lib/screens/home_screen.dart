import 'package:flutter/material.dart';
import 'package:flutter_temp/widgets/todos/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const ToDoList(),
    );
  }
}
