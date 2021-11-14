// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'liststudent.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      name = user.displayName.toString();
      email = user.email.toString();
      imgurl = user.photoURL.toString();
    }
    else{
      name = "NOT FOUND";
      email = "NOT FOUND";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text('Shotro App'),
      ),
      body: ListStudentPage(),
      drawer: MyDrawer(),
    );
  }
}
