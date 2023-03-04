import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_temp/models/to_do.dart';

class ToDos with ChangeNotifier {
  String apiBase = 'https://jsonplaceholder.typicode.com/todos';
  List<ToDo> _items = [];

  ToDos() {
    fetchToDos();
  }

  List<ToDo> get items => _items;

  Future<void> fetchToDos() async {
    try {
      final url = Uri.parse(apiBase);
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<ToDo> loadedTodos = [];
      extractedData.asMap().forEach((index, note) {
        loadedTodos.add(ToDo.fromMap(note));
      });
      _items = loadedTodos;
      notifyListeners();
    } catch (e) {
      _items = [];
      print(e);
      // throw (e);
    }
  }

  void addToDo(ToDo toDo) {
    _items.add(toDo);
    notifyListeners();
  }

  void removeToDo(ToDo toDo) {
    _items.remove(toDo);
    notifyListeners();
  }

  // Future<void> addNote(Note note) async {
  //   final url = Uri.parse(apiBase);

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode(note.toJson()),
  //     );

  //     if (response.statusCode == 201) {
  //       final newNote = Note(
  //         id: json.decode(response.body)['id'],
  //         requestId: note.requestId,
  //         name: note.name,
  //         value: note.value,
  //         createdDate: note.createdDate,
  //       );

  //       _items.add(newNote);

  //       notifyListeners();
  //     }

  //     if (response.statusCode == 400) {
  //       HttpException(response.body);
  //     }
  //   } catch (error) {
  //     // ToDO
  //     rethrow;
  //   }
  // }

  // Future<void> updateNote(int id, Note note) async {
  //   final url = Uri.parse('$apiBase/$id');
  //   try {
  //     final response = await http.put(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode(note.toJson()),
  //     );
  //     if (response.statusCode == 204) {
  //       final noteIndex = _items.indexWhere((x) => x.id == id);
  //       if (noteIndex >= 0) {
  //         _items[noteIndex] = note;
  //         notifyListeners();
  //       } else {
  //         print('...');
  //       }
  //     }

  //     if (response.statusCode == 400) {
  //       HttpException(response.body);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> deleteNote(int id, Note note) async {
  //   final url = Uri.parse('$apiBase/$id');
  //   try {
  //     final response = await http.delete(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     if (response.statusCode == 204) {
  //       final noteIndex = _items.indexWhere((x) => x.id == id);
  //       if (noteIndex >= 0) {
  //         _items.removeAt(noteIndex);
  //         notifyListeners();
  //       }
  //     }

  //     if (response.statusCode == 400) {
  //       HttpException(response.body);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
