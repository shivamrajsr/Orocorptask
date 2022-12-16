import 'package:flutter/material.dart';
import 'package:task_oro/task/bloc/task_bloc.dart';
import 'package:task_oro/task/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomePage(),
    );
  }
}

