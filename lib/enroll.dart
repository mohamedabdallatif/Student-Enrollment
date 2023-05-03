import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  String? _fname,
      _lname,
      _dateofbirth,
      _address,
      _religion,
      _nationality,
      _gender;

  Future<int> insertStudent() async {
    var query =
        'fname=$_fname&lname=$_lname&dateofbirth=$_dateofbirth&address=$_address&religion=$_religion&nationality=$_nationality&gender=$_gender';
    var url = 'https://studentssqlserver123.000webhostapp.com/insert.php';
    http.Response res = await http.post(Uri.parse(url));
    print(res.body);
    return res.statusCode;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (value) {
                    setState(() {
                      _fname = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                  onChanged: (value) {
                    setState(() {
                      _lname = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                      setState(() {
                        _dateofbirth = DateFormat.yMMMd().format(value!);
                      });
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
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                  onChanged: (value) {
                    setState(() {
                      _religion = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                  onChanged: (value) {
                    setState(() {
                      _nationality = value;
                    });
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
                    groupValue: _gender,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('Female'),
                    value: 'Female',
                    contentPadding: EdgeInsets.zero,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
                ElevatedButton(
                    onPressed: () async {
                      // Navigator.of(context).pushNamed('parent');
                      int responsecode = await insertStudent();
                      if (responsecode == 200) {
                        ShowAlterDialogMessage(
                            context, 'Student Is Inserted Successfully');
                      } else {
                        ShowAlterDialogMessage(context,
                            'Oops, Something Wrong within Inserting! Try Again');
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: const Text('Enroll'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowAlterDialogMessage(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enroll Confirmation'),
        content: SizedBox(
          height: 120,
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
