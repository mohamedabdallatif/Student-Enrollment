// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sql_project/home.dart';
import 'package:sql_project/student_detials.dart';
import 'package:http/http.dart' as http;


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
var url = 'https://studentssqlserver123.000webhostapp.com/select.php';
Future<void> sendSelectStatementToPhp(var selectStatement,var val) async {
  final response = (await http.post(Uri.parse(url), body: {
   'selectStatement': selectStatement,
    'val':val,
  }));
  print(response.body.toString());
  
  if (response.statusCode == 200) {
    print('Select statement sent to PHP script successfully');
  } else {
    print('Error sending select statement to PHP script');
  }
}

// List of maps
//each row in table is map
 

class _StudentDataState extends State<StudentData> {
  @override
  void initState() {
    sendSelectStatementToPhp(widget.option, widget.val);
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
        itemCount:response ,
        itemBuilder: (context, index) {
          for (var element in reponseBody) {
         //   if (element['${widget.option}'] == widget.val) {
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
           // }
         }
        },
      ),
    );
  }
}
