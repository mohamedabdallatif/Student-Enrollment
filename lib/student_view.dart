import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class StudentDataView extends StatefulWidget {
  StudentDataView({Key? key, required this.data}) : super(key: key);
  Map<String, dynamic> data;

  @override
  State<StudentDataView> createState() => _StudentDataViewState();
}

class _StudentDataViewState extends State<StudentDataView> {
  var fnamecontroller = TextEditingController();
  var lnamecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var religioncontroller = TextEditingController();
  var nationalitycontroller = TextEditingController();
  var dateController = TextEditingController();
  var gender;

  var updateUrl = 'https://studentssqlserver123.000webhostapp.com/update.php';

  Future updateStudent(String fname, String lname, String date, String Address,
      String religion, String nationality, String gender, String id) async {
    final response = await http.post(
      Uri.parse(updateUrl),
      body: {
        'fname': fname,
        'lname': lname,
        'date': date,
        'Address': Address,
        'religion': religion,
        'nationality': nationality,
        'gender': gender,
        'id': id,
      },
    );
    return response;
  }

  @override
  void initState() {
    fnamecontroller.text = widget.data['First_Name'];
    lnamecontroller.text = widget.data['Last_Name'];
    addresscontroller.text = widget.data['Address'];
    religioncontroller.text = widget.data['Religion'];
    nationalitycontroller.text = widget.data['Nationality'];
    dateController.text = widget.data['Date_Of_Birth'];
    gender = widget.data['Gender'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Data'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
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
                      return 'First name can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      return 'Last name can\'t be lesser than 2';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: dateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date Of Birth can\'t br empty';
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
                      return 'Address can\'t be lesser than 2';
                    }
                    return null;
                  },
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
                      return 'Religion can\'t be lesser than 2';
                    }
                    return null;
                  },
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
                      return 'Nationality can\'t be lesser than 2';
                    }
                    return null;
                  },
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
                      final result = await updateStudent(
                        fnamecontroller.text,
                        lnamecontroller.text,
                        dateController.text,
                        addresscontroller.text,
                        religioncontroller.text,
                        nationalitycontroller.text,
                        gender,
                        widget.data['Id'].toString(),
                      );
                      if (result.statusCode == 200) {
                        final responseData = json.decode(result.body);
                        if (responseData['status'] == 'success') {
                          showAlterDialogMessage(
                              context, 'Student Is Inserted Successfully');
                        } else {
                          showAlterDialogMessage(context,
                              'Error ${result.statusCode} ${result.reasonPhrase}');
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlterDialogMessage(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enroll Confirmation'),
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
      ),
      barrierDismissible: false,
    );
  }
}
