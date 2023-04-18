import 'package:flutter/material.dart';
import 'package:sql_project/enroll.dart';
import 'package:sql_project/home.dart';
import 'package:sql_project/parent_detial.dart';
import 'package:sql_project/select.dart';
import 'package:sql_project/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'enrollment' :(context) => const Enrollment(),
        'selection' :(context) => const SelectionPage(),
        'update' :(context) => const UpdatePage(),
        'parent' :(context) => const ParentDetials(),
      },
      home: const MyHomePage(),
    );
  }
}

