import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class CourseView extends StatefulWidget {
  Map<String, dynamic> curstd;

  CourseView({Key? key, required this.curstd}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  List<String> courses = ['Arabic', 'English', 'C', 'Java'];
  List isClicked = [false, false, false, false];
  List<String> selectedCourses = [];

  var updateUrl = 'https://studentssqlserver123.000webhostapp.com/update.php';

  Future updateStudent(
      int id,
      String fname,
      String lname,
      String date,
      String address,
      String religion,
      String nationality,
      String gender,
      List list) async {
    final response = await http.post(Uri.parse(updateUrl), body: {
      'id': id.toString(),
      'fname': fname,
      'lname': lname,
      'date': date,
      'Address': address,
      'religion': religion,
      'nationality': nationality,
      'gender': gender,
      'list': list.toString(),
    });
    return response;
  }

  @override
  void initState() {
    selectedCourses = widget.curstd['Course_Name'].split(",");
    String f = selectedCourses.first;
    f = f.substring(1);
    selectedCourses.first = f;
    f = selectedCourses.last;
    f = f.substring(0, f.length - 1);
    selectedCourses.last = f;
    for (int i = 0; i < selectedCourses.length; i++) {
      selectedCourses[i] = selectedCourses[i].trim();
    }
    for (int i = 0; i < courses.length; i++) {
      if (selectedCourses.contains(courses[i])) {
        isClicked[i] = true;
      }
    }
    super.initState();
  }

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
                      title: Text(courses[index]),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          setState(() {
                            isClicked[index] = value!;
                            if (isClicked[index]) {
                              if (!selectedCourses.contains(courses[index])) {
                                selectedCourses.add(courses[index]);
                              }
                            } else {
                              int idx = selectedCourses.indexOf(courses[index]);
                              if (idx != -1) {
                                selectedCourses.removeAt(idx);
                              }
                            }
                          });
                        },
                        value: isClicked[index],
                      ),
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () async {
                  // print(selectedCourses);
                  if (isClicked.any((element) => element == true)) {
                    final result = await updateStudent(
                        widget.curstd['Id'],
                        widget.curstd['First_Name'],
                        widget.curstd['Last_Name'],
                        widget.curstd['Date_Of_Birth'],
                        widget.curstd['Address'],
                        widget.curstd['Religion'],
                        widget.curstd['Nationality'],
                        widget.curstd['Gender'],
                        selectedCourses
                      );
                    if (result.statusCode == 200) {
                      final responseData = json.decode(result.body);
                      if (responseData['status'] == 'success') {
                        setState((){});
                        AwesomeDialog(
                            context: context,
                            title: 'Student Is Updated Successfully',
                            body: Center(
                                child: Column(
                              children: [
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 2,
                                ),
                                const SizedBox(height: 15),
                                const Text('Student Is Updated Successfully'),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
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
                            ))).show();
                      } else {
                        ShowAlterDialogMessage(context,
                            'Error ${result.statusCode} ${result.reasonPhrase}');
                      }
                    }
                  } else {
                    AwesomeDialog(
                            context: context,
                            title: 'please choose any courses')
                        .show();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: const Text('Update'))
          ],
        ));
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