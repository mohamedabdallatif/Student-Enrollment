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
List<dynamic> jsonResponse=[];
Future<List> sendSelectStatementToPhp(var selectStatement,var val) async {
  final response = (await http.post(Uri.parse(url), body: {
   'selectStatement': selectStatement,
    'val':val,
  }));
  final responseBody = utf8.decode(response.bodyBytes);
   jsonResponse = json.decode(responseBody);
  //print(jsonResponse.toString());
  
  if (response.statusCode == 200) {
    print('Select statement sent to PHP script successfully');
  } else {
    print('Error sending select statement to PHP script');
  }
  return jsonResponse;
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
      body: FutureBuilder(
        future: sendSelectStatementToPhp(widget.option, widget.val),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasData){
              print('${snapshot.data}');
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('ID:${snapshot.data?[index]['Id']}'),
                    subtitle: Text('Name:${snapshot.data?[index]['First_Name']} ${snapshot.data?[index]['Last_Name']}'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                      return  StudentDetials(element: snapshot.data?[index],);
                      } ));
                    },
                  );
                }
                );
            }
          }
          return Text('');
        },
      )
    );
  }
}
