import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
List reponseBody=[];
class _MyHomePageState extends State<MyHomePage> {
   Future getData() async{
    var url = 'https://studentssqlserver123.000webhostapp.com/get.php';
    var res = await http.get(Uri.parse(url));
    reponseBody = json.decode(res.body);
    print(reponseBody.toString());
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed:(){
              Navigator.of(context).pushNamed('enrollment');
            } ,
             style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
             ),
             child:const Text('Enroll new student'),
              ),
            ElevatedButton(onPressed:(){
              Navigator.of(context).pushNamed('selection');
            } ,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
             ),
             child:const Text('Select Student')
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushNamed('update');
              },
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
             ),
               child: const Text('Update Student'))
          ],
        ),
      ) ,
    );
  }
}

