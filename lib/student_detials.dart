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
    List<String> coursesList = widget.element['Course_Name'].split(",");
    String f = coursesList.first;
    f = f.substring(1);
    coursesList.first = f;
    f = coursesList.last;
    f = f.substring(0, f.length - 1);
    coursesList.last = f;
    return Scaffold(
      appBar: AppBar(
        title: Text('ID ${widget.element['Id']}\'s Detials'),
        backgroundColor: Colors.teal,
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${widget.element['First_Name']} ${widget.element['Last_Name']}',
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Date of Birth: ${widget.element['Date_Of_Birth']}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 32.0),
            Text(
              'Address: ${widget.element['Address']}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 32.0),
            Text(
              'Religion: ${widget.element['Religion']}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 32.0),
             Text(
              'Nationality: ${widget.element['Nationality']}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 32.0),
            
            const Text(
              'Courses:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: coursesList.length,
              itemBuilder: (context, index) {
                return Text(
                  '${index + 1}. ${coursesList[index]}',
                  style: const TextStyle(fontSize: 18.0),
                );
              },
            ),
          ],
        ),
      ),
    );
    
  }
}
