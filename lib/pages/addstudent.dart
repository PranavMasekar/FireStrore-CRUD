import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var email = "";
  var password = "";

  final namecontrl = TextEditingController(text: "Email Se Naam");
  final emailcontrl = TextEditingController();
  final passcontrl = TextEditingController();

  @override
  void dispose() {
    namecontrl.dispose();
    emailcontrl.dispose();
    passcontrl.dispose();
    super.dispose();
  }

  clearText() {
    namecontrl.clear();
    emailcontrl.clear();
    passcontrl.clear();
  }

  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> addUser() {
    return students.add(
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 20.0),
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
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailcontrl,
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
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passcontrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
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
                            email = emailcontrl.text;
                            password = passcontrl.text;
                            addUser();
                            clearText();
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
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
              Container(
                  child: Column(children: [
                Text("Only For Devlopers !!"),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    )
                  },
                  child: Text(
                    'PASS',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
