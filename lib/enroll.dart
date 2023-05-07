import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:sql_project/courses_page.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  var fnamecontroller = TextEditingController();
  var lnamecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var religioncontroller = TextEditingController();
  var nationalitycontroller = TextEditingController();
  var gender;
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enroll Student'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Student\'s Detials',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: fnamecontroller,
                  decoration: const InputDecoration(
                      label: Text('First name'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'First name can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'First name can\'t be less than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: lnamecontroller,
                  decoration: const InputDecoration(
                      label: Text('Last name'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Last name can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Last name can\'t be less than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: dateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date Of Birth can\'t be empty';
                    }
                    return null;
                  },
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(1900),
                            lastDate: DateTime.now())
                        .then((value) {
                      dateController.text = value!.toIso8601String();
                    });
                  },
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                      label: Text('Date of Birth'),
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: addresscontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text('Address'),
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Address can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Address can\'t be less than 2';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: religioncontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text('Religion'),
                      prefixIcon: Icon(Icons.mosque),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Religion can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Religion can\'t be less than 2';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nationalitycontroller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text('Nationality'),
                      prefixIcon: Icon(Icons.airlines),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.length > 100) {
                      return 'Nationality can\'t be greater than 100';
                    }
                    if (value.length < 2) {
                      return 'Nationality can\'t be less than 2';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Gender',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: gender,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    }),
                RadioListTile(
                    title: const Text('Female'),
                    value: 'Female',
                    contentPadding: EdgeInsets.zero,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    }),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CoursePage(
                            fnamecontroller: fnamecontroller.text,
                            lnamecontroller: lnamecontroller.text,
                            addresscontroller: addresscontroller.text,
                            dateController: dateController.text,
                            religioncontroller: religioncontroller.text,
                            nationalitycontroller: nationalitycontroller.text,
                            gender: gender,
                          );
                        }));
                     }
                      else if(gender==null){
                        AwesomeDialog(context: context,
                        title: 'Complete Data'
                        ).show();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
