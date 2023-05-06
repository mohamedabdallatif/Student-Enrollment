// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StudentDetials extends StatefulWidget {
 var element;

  StudentDetials({
    Key? key,
    required this.element,
  }) : super(key: key);
  @override
  State<StudentDetials> createState() => _StudentDetialsState();
}

class _StudentDetialsState extends State<StudentDetials> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID ${widget.element['Id']}\'s Detials'),
        backgroundColor: Colors.teal,
      ),
      body:Column(
        children: [
          const Text('Student\'s Detials',
          style: TextStyle(
            fontSize: 25,
        fontWeight: FontWeight.bold,
          ),
          ),
          Text('Name: ${widget.element['First_Name']} ${widget.element['Last_Name']}',
        style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      ) ,
       Text('Date of Birth: ${widget.element['Date_Of_Birth']}',
        style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      ) ,
      const Text('Courses\'s Detials',
          style: TextStyle(
            fontSize: 25,
        fontWeight: FontWeight.bold,
          ),
          ),
          Text('Courses:${widget.element['courses'][1]}')
        ],
      )
    );
  }
}