import 'package:flutter/material.dart';
import 'package:flutter_temp/providers/to_dos.dart';
import 'package:flutter_temp/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ToDos(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Template',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
