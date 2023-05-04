import 'package:flutter/material.dart';
import 'package:sql_project/data.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String selectedOption =
      'Id'; // This variable will hold the currently selected option
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
      body: Column(
        children: [
          const Text(
            'Select By :',
            style: TextStyle(fontSize: 20),
          ),
          DropdownButton<String>(
            value: selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
            items: <String>['Id','First_Name', 'Last_Name', 'Gender', 'Nationality','all']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: searchController,
                validator: (value) {
                     if(selectedOption!='all'){
                        if (value!.length > 100) {
                        return 'Input can\'t be greater than 100';
                      }
                      if (value.isEmpty) {
                        return 'Input can\'t be lesser than 2';
                      }
                     }
                      return null;
                    },
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            formKey.currentState!.validate();
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  StudentData(val: searchController.text,option:selectedOption ,),
              ));
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
           child: const Text('Search!',)
            )
        ],
      ),
    );
  }
}
