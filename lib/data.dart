// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_project/student_detials.dart';
import 'package:sql_project/student_view.dart';

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

int resStatusVal = 0;
var mysort='Id';
var selectUrl = 'https://studentssqlserver123.000webhostapp.com/select.php';

class _StudentDataState extends State<StudentData> {
  List? dataresult;
  List? sortresult;
  @override
  void initState() {
    resStatusVal = 0;
   // sendSelectStatement(widget.option, widget.val);
    super.initState();
  }

  Future sendSelectStatement(var selectStatement, var val,var sort) async {
    final response = await http.post(Uri.parse(selectUrl), body: {
      'selectStatement': selectStatement,
      'val': val,
      'sort':sort
    });
   // final resbody = json.decode(response.body);
    if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
  }

  var deleteUrl = 'https://studentssqlserver123.000webhostapp.com/delete.php';
  Future<int> deleteStudent(int id) async {
    final response =
        await http.post(Uri.parse(deleteUrl), body: {'id': id.toString()});
   // final resbody = json.decode(response.body);
    return response.statusCode;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data'),
          backgroundColor: Colors.teal,
           actions: [
          PopupMenuButton(
            onSelected: (value){
                setState(() {
                  mysort = value;
                });
            },
            itemBuilder: (context){
              return [
                const PopupMenuItem(
                  value: 'Id',
                  child:Text('Sort By Id')
                   ),
               const PopupMenuItem(
                  value: 'First_Name',
                  child:Text('Sort By First Name')
                   ),
                   const PopupMenuItem(
                  value: 'Last_Name',
                  child:Text('Sort By Last Name')
                   ),
              ];
            })
        ],
        ),
        body: FutureBuilder(
          future: sendSelectStatement(widget.option, widget.val,mysort),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.connectionState==ConnectionState.done){
               if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    tileColor: Colors.teal[300],
                                    leading: const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                    title: Text(
                                        "${snapshot.data![index]['First_Name']} ${snapshot.data![index]['Last_Name']}"),
                                    subtitle: Text(snapshot.data![index]['Address']),
                                    trailing: Container(
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return StudentDataView(
                                                    data: snapshot.data![index]);
                                              }));
                                            },
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () async {
                                              int res = await deleteStudent(
                                                  snapshot.data![index]['Id']);
                                              String resmsg;
                                              if (res == 200)
                                                resmsg =
                                                    'Student Deleted Successfully';
                                              else
                                                resmsg = 'Oops! Error within Deleting';
                                              showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlterDialogMessage(
                                                          context, resmsg)
                                                      );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => StudentDetials(
                                                element: dataresult![index]),
                                          ));
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            },
                          ),
              );
            }
            
            }
            
           
          return const Text('No Data');
        },)
        );
  }

  Widget AlterDialogMessage(BuildContext context, String msg) {
    return AlertDialog(
      title: const Text('Searching Result'),
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
    );
  }
}
