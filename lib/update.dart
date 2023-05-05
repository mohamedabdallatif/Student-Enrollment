// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdatePage extends StatefulWidget {
var element;
   UpdatePage({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  @override
  Widget build(BuildContext context) {
      var gender='${widget.element['Gender']}';
      var fnamecontroller;
  var lnamecontroller ;
  var addresscontroller ;
  var religioncontroller ;
  var nationalitycontroller ;
    var dateController ;
    var insertUrl = 'https://studentssqlserver123.000webhostapp.com/update.php';

  Future updateStudent(int Id,String fname, String lname, String date, String Address,
      String religion, String nationality, String gender) async {
    final response = await http.post(
      Uri.parse(insertUrl),
      body: {
        'Id':Id,
        'fname': fname,
        'lname': lname,
        'date': date,
        'Address': Address,
        'religion': religion,
        'nationality': nationality,
        'gender': gender,
      },
    );
    return response;
  }
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Update student'),
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
                  initialValue:'${widget.element['First_Name']}',
                  onSaved: (newValue) {
                    fnamecontroller =newValue;
                  },
                //  controller: fnamecontroller,
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
                   initialValue: '${widget.element['Last_Name']}',
                    onSaved: (newValue) {
                    lnamecontroller =newValue;
                  },
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
                   initialValue: '${widget.element['Date_Of_Birth']}',
                    onSaved: (newValue) {
                    dateController =newValue;
                  },
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
                      dateController = value!.toIso8601String();
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
                   onSaved: (newValue) {
                    addresscontroller =newValue;
                  },
                   initialValue: '${widget.element['Address']}',
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
                   initialValue: '${widget.element['Religion']}',
                    onSaved: (newValue) {
                    religioncontroller =newValue;
                  },
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
                   initialValue: '${widget.element['Nationality']}',  
                    onSaved: (newValue) {
                    nationalitycontroller =newValue;
                  },                
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
                    ElevatedButton(onPressed:()async{
                      await updateStudent(widget.element['Id'],
                      fnamecontroller?fnamecontroller:widget.element['First_name'],
                       lnamecontroller?lnamecontroller:widget.element['Last_name'],
                        dateController?dateController:widget.element['Date_Of_Birth'],
                        addresscontroller?addresscontroller:widget.element['Address'],
                         religioncontroller?religioncontroller:widget.element['Religion'],
                         nationalitycontroller?nationalitycontroller:widget.element['Nationality'],
                          gender);
                    } ,
                     child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}