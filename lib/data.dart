// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sql_project/home.dart';
import 'package:sql_project/student_detials.dart';

class StudentData extends StatefulWidget {
  var val;
  var option;
  StudentData({
    Key? key,
    required this.val,
    required this.option,
  }) : super(key: key);
  @override
  State<StudentData> createState() => _StudentDataState();
}

var count = 0;
// List of maps
//each row in table is map
 find(value, op) {
  count = 0;
  for (var element in reponseBody) {
    if (element['$op'] == value) {
      count++;
    }
  }
}

class _StudentDataState extends State<StudentData> {
  @override
  void initState() {
    /*  WidgetsBinding.instance.addPostFrameCallback((_) async{ 
      await find(widget.val, widget.option);
    }); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: find(widget.val, widget.option),
        itemBuilder: (context, index) {
          for (var element in reponseBody) {
            if (element['${widget.option}'] == widget.val) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    const TableRow(
                      children: [
                        TableCell(
                          child: Text('ID'),
                        ),
                        TableCell(
                          child: Text('First Name'),
                        ),
                        TableCell(
                          child: Text('Last Name'),
                        ),
                        TableCell(
                          child: Text('Phone'),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        StudentDetials(element: element),
                                  ));
                            },
                            child: Text(
                              '${element['Id']}',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Text('${element['First Name']}'),
                        ),
                        TableCell(
                          child: Text('${element['Last Name']}'),
                        ),
                        TableCell(
                          child: Text('${element['Phone']}'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
