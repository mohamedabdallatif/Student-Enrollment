import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Enrollment'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body:Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
            ElevatedButton(onPressed:(){
              Navigator.of(context).pushNamed('enrollment');
            } ,
             style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
             child:const Text('Enroll new student',
              style: TextStyle(fontSize: 18.0),
             ),
              ),
            const SizedBox(
                height: 16,
              ),
            ElevatedButton(onPressed:(){
              Navigator.of(context).pushNamed('selection');
            } ,
           style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
             child:const Text('Search for a Student',
             style: TextStyle(fontSize: 16.0),
             )
              ),
          ],
        ),
      ) ,
    );
  }
}

