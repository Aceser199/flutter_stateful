import 'package:flutter/material.dart';
import 'package:flutter_temp/models/to_do.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({super.key, required this.toDo});
  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(toDo.value),
      trailing: Text(toDo.date),
    );
  }
}
