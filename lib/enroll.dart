
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  var dateController = TextEditingController();
  var gender = '';
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
                const Text('Student\'s Detials',
                style: TextStyle(
                  fontSize: 20
                ),
                ),
              const  SizedBox(
                  height: 5,
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
                      dateController.text = DateFormat.yMMMd().format(value!);
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
                ),
              const  SizedBox(
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: const Text('Gender',
                  style: TextStyle(fontSize: 20),
                  ),
                ),
               RadioListTile(
                title: const Text('Male'),
                value: 'male',
                groupValue: gender,
                contentPadding: EdgeInsets.zero,
                 onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                 }
                 ),
                 RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                contentPadding: EdgeInsets.zero,
                groupValue: gender,
                 onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                 }
                 ),

                ElevatedButton(onPressed: (){
                  Navigator.of(context).pushNamed('parent');
                }, 
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.teal)
                ),
                child: const Text('Next')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
