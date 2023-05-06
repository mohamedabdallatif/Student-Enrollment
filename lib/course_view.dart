import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class CourseView extends StatefulWidget {
  var fname;
  var lname;
  var address;
  var religion;
  var nationality;
  var gender;
  var birthdate;

  CourseView(
  {
    Key? key,
    this.fname,
    this.lname,
    this.address,
    this.nationality,
    this.religion,
    this.birthdate,
    this.gender
  }): super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  List courses = ['Arabic', 'English', 'C', 'Java'];
  List selectedCourses = [];
  List isClicked = [false, false, false, false];
  var insertUrl = 'https://studentssqlserver123.000webhostapp.com/insert.php';

  // Future insertStudent(String fname, String lname, String date, String Address,
  //     String religion, String nationality, String gender, List list) async {
  //   final response = await http.post(Uri.parse(insertUrl), body: {
  //     'fname': fname,
  //     'lname': lname,
  //     'date': date,
  //     'Address': Address,
  //     'religion': religion,
  //     'nationality': nationality,
  //     'gender': gender,
  //     'list': list.toString(),
  //   });
  //   return response;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Courses'),
          backgroundColor: Colors.teal,
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
            ElevatedButton(
                onPressed: () {
                  // if (isClicked.any((element) => element == true)) {
                  //   final result = await insertStudent(
                  //       widget.fnamecontroller,
                  //       widget.lnamecontroller,
                  //       widget.dateController,
                  //       widget.addresscontroller,
                  //       widget.religioncontroller,
                  //       widget.nationalitycontroller,
                  //       widget.gender,
                  //       selectedCourses);
                  //   if (result.statusCode == 200) {
                  //     final responseData = json.decode(result.body);
                  //     if (responseData['status'] == 'success') {
                  //       print('Data inserted successfully');
                  //       AwesomeDialog(
                  //           context: context,
                  //           title: 'Student Is Inserted Successfully',
                  //           body: Center(
                  //               child: Column(
                  //                 children: [
                  //                   const Divider(
                  //                     color: Colors.grey,
                  //                     thickness: 2,
                  //                   ),
                  //                   const SizedBox(height: 15),
                  //                   Text('Student Is Inserted Successfully'),
                  //                   const SizedBox(height: 10),
                  //                   ElevatedButton(
                  //                       onPressed: () {
                  //                         Navigator.pop(context);
                  //                         Navigator.pop(context);
                  //                         Navigator.pop(context);
                  //                       },
                  //                       style: ElevatedButton.styleFrom(
                  //                         shape: RoundedRectangleBorder(
                  //                           borderRadius: BorderRadius.circular(30),
                  //                         ),
                  //                       ),
                  //                       child: const Text('Close!')),
                  //                 ],
                  //               ))).show();
                  //     } else {
                  //       ShowAlterDialogMessage(context,
                  //           'Error ${result.statusCode} ${result.reasonPhrase}');
                  //     }
                  //   }
                  // } else {
                  //   AwesomeDialog(
                  //       context: context,
                  //       title: 'please choose any courses')
                  //       .show();
                  // }
                },
                child: const Text('Enroll'))
          ],
        )
    );

  }
}

void ShowAlterDialogMessage(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Enroll Confirmation'),
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const SizedBox(height: 15),
            Text(msg),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Close!')),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
