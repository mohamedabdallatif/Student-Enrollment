import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sql_project/enroll.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List courses = ['Arabic', 'English', 'C', 'Java'];
  List selectedCourses = [];
  List isClicked = [false, false, false, false];
    var insertUrl = 'https://studentssqlserver123.000webhostapp.com/insert.php';

  Future insertStudent(String fname, String lname, String date, String Address,
      String religion, String nationality, String gender,List list) async {
        Map data= {
    'fname': fname,
        'lname': lname,
        'date': date,
        'Address': Address,
        'religion': religion,
        'nationality': nationality,
        'gender': gender,
        'list':list
   };
     String body = json.encode(data);
    final response = await http.post(
      Uri.parse(insertUrl),
      headers: {'Content-Type': 'application/json'},
      body: body
    );
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Courses'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${courses[index]}'),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            isClicked[index] = value!;
                            if (isClicked[index]) {
                              if (!selectedCourses.contains(courses[index])) {
                                selectedCourses.add(courses[index]);
                              }
                              print(selectedCourses);
                            }
                          });
                        },
                        value: isClicked[index],
                      ),
                    );
                  }),
            ),
            ElevatedButton(onPressed: ()async{
               final result = await insertStudent(
                          fnamecontroller.text,
                          lnamecontroller.text,
                          dateController.text,
                          addresscontroller.text,
                          religioncontroller.text,
                          nationalitycontroller.text,
                          gender,
                          selectedCourses);
                      if (result.statusCode == 200) {
                        final responseData = json.decode(result.body);
                        if (responseData['status'] == 'success') {
                          print('Data inserted successfully');
                          ShowAlterDialogMessage(context, 'Student Is Inserted Successfully');
                        } else {
                          ShowAlterDialogMessage(context,
                            'Error ${result.statusCode} ${result.reasonPhrase}');
                        }
                      }
            },
             child:const Text('Enroll') )
          ],
        ));
  }
}
