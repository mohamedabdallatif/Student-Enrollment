import 'package:flutter/material.dart';
import 'package:sql_project/enroll.dart';
import 'package:sql_project/home.dart';
import 'package:sql_project/select.dart';
import 'package:sql_project/update.dart';

void main() => runApp(const StudentApp());

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'homepage':(context) => const MyHomePage(),
        'enrollment' :(context) => const Enrollment(),
        'selection' :(context) => const SelectionPage(),
        'update' :(context) => const UpdatePage(),
      },
      initialRoute: 'homepage',
    );
  }
}

