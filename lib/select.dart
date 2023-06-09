import 'package:flutter/material.dart';
import 'package:sql_project/data.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String selectedOption = 'Id';
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select student'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select By : ',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  DropdownButton<String>(
                    value: selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue!;
                      });
                    },
                    items: <String>[
                      'Id',
                      'First_Name',
                      'Last_Name',
                      'Address',
                      'Nationality',
                      'Gender'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Form(
                key: formKey,
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  ),
                  validator: (value) {
                      if (value!.length > 100) {
                        return 'Input can\'t be greater than 100';
                      }
                      if (value.length <2) {
                        return 'Input can\'t be less than 2';
                      }
                    
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentData(
                            val: searchController.text, option: selectedOption),
                      ),
                    );
                    }
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  child: const Text(
                    'Search!',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
