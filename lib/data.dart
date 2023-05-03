// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sql_project/home.dart';

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
  count=0;
  for (var element in reponseBody) {
    if (element['$op'] == value) {
      count++;
    }
  }
}

class _StudentDataState extends State<StudentData> {
  @override
  void initState() {
    find(widget.val, widget.option);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data')),
      body: ListView.separated(
        itemCount: count,
        itemBuilder: (context, index) {
          if(count ==0){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else{
            for (var element in reponseBody) {
            if (element['${widget.option}'] == widget.val) {
              return Text('$element');
            }
          }
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          );
        },
        
      ),
    );
  }
}
