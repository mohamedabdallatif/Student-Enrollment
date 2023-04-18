import 'package:flutter/material.dart';

class ParentDetials extends StatefulWidget {
  const ParentDetials({super.key});

  @override
  State<ParentDetials> createState() => _ParentDetialsState();
}

class _ParentDetialsState extends State<ParentDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enroll Student'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child:Column(
              children: [
                const Text('Parents\'s Detials',
                style: TextStyle(
                  fontSize: 20
                ),
                ),
              const  SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Father\'s name'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'name can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'name can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Father\'s Occupation'),
                      prefixIcon: Icon(Icons.work),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Occupation can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Occupation can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
                 const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Mother\'s name'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'name can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'name can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      label: Text('Mother\'s Occupation'),
                      prefixIcon: Icon(Icons.work),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Occupation can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Occupation can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
             const   SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: (){

                }, 
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.teal)
                ),
                child: const Text('Enroll')
                )
              ],
            )
             ),
        ),
      ),
    );
  }
}