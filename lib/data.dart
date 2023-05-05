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
var url = 'https://studentssqlserver123.000webhostapp.com/select.php';

class _StudentDataState extends State<StudentData> {
  List? dataresult;

  @override
  void initState() {
    resStatusVal = 0;
    sendSelectStatement(widget.option, widget.val);
    super.initState();
  }

  Future<void> sendSelectStatement(var selectStatement, var val) async {
    final response = (await http.post(Uri.parse(url), body: {
      'selectStatement': selectStatement,
      'val': val,
    }));
    final resbody = json.decode(response.body);
    // print(resbody.toString());
    if (response.statusCode == 200) {
      setState(() {
        resStatusVal = 1;
      });
    } else {
      setState(() {
        resStatusVal = 2;
      });
    }
    dataresult = resbody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Data'),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: resStatusVal == 0
              ? const Center(child: CircularProgressIndicator())
              : resStatusVal == 2
                  ? showAlterDialogMessage(
                      context, 'This Student is not Enrolled')
                  : ListView.builder(
                      itemCount: dataresult!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              tileColor: Colors.teal[300],
                              leading: const Icon(Icons.person, size: 30,),
                              title: Text(
                                  "${dataresult![index]['First_Name']} ${dataresult![index]['Last_Name']}"),
                              subtitle: Text(dataresult![index]['Address']),
                              trailing:IconButton(icon:const Icon(Icons.edit)
                               ,onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return StudentDataView(data: dataresult![index]);
                                }));
                              },) ,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StudentDetials(element: dataresult![index]),
                                    ));
                              },
                            ),
                            const SizedBox(height: 20,)
                          ],
                        );
                      },
                    ),
        ));
  }

  Widget showAlterDialogMessage(BuildContext context, String msg) {
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
