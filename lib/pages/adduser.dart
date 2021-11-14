// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _formKey = GlobalKey<FormState>();
  var name = "";
  var number = "";
  var doses = "";

  final namecontrl = TextEditingController();
  final numbercontrl = TextEditingController();
  final dosecontrl = TextEditingController();

  @override
  void dispose() {
    namecontrl.dispose();
    numbercontrl.dispose();
    dosecontrl.dispose();
    super.dispose();
  }

  clearText() {
    namecontrl.clear();
    numbercontrl.clear();
    dosecontrl.clear();
  }

  // CollectionReference students =
  //     FirebaseFirestore.instance.collection('students');
  // Future<void> addUser() {
  //   return students.add(
  //     {
  //       'name': name,
  //       'number': number,
  //       'doses': doses,
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text("Fill Your Information"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: namecontrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: numbercontrl,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Phone Number';
                    } else if (value.length != 10) {
                      return 'Please Enter Valid Phone Number';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Number Of Doses',
                    labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: dosecontrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter doses';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: new Text(
                  "To Enter the Store you need to have atlease 1 Dose of COVID-19 Vaccine",
                  style: TextStyle(color: Colors.red.withOpacity(1)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            name = namecontrl.text;
                            number = numbercontrl.text;
                            doses = dosecontrl.text;
                            clearText();
                          });
                          Navigator.pushReplacementNamed(context, "/home",
                              arguments: {
                                "name": name,
                                "doses": doses,
                                "number": number,
                              });
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {clearText()},
                      child: Text(
                        'Reset',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              // Container(
              //   child: Column(
              //     children: [
              //       Text("Only For Devlopers !!"),
              //       ElevatedButton(
              //         onPressed: () => {
              //           Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => HomePage(),
              //             ),
              //           )
              //         },
              //         child: Text(
              //           'PASS',
              //           style: TextStyle(fontSize: 18.0),
              //         ),
              //         style: ElevatedButton.styleFrom(primary: Colors.red),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
