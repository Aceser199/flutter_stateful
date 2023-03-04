import 'package:flutter/material.dart';
import 'package:flutter_temp/providers/to_dos.dart';
import 'package:flutter_temp/widgets/todos/add_todo.dart';
import 'package:flutter_temp/widgets/todos/todo_card.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: AddTodo(),
        ),
        Expanded(
          child: FutureBuilder(
            future: Provider.of<ToDos>(context, listen: false).fetchToDos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<ToDos>(
                child: const Center(
                  child: Text('No Todos yet'),
                ),
                builder: (context, todos, child) => todos.items.isEmpty
                    ? child!
                    : ListView.separated(
                        itemCount: todos.items.length,
                        itemBuilder: (context, index) {
                          final todo = todos.items[index];
                          return ToDoCard(toDo: todo);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                      ),
              );
            },
          ),
        ),
      ],
    );
  }
}
