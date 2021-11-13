import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
// import 'addstudent.dart';
import 'liststudent.dart';
import 'drawer.dart';
import 'profilePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final user = auth.currentUser;
    // name = user!.displayName.toString();
    // email = user.email.toString();
    // imgurl = user.photoURL.toString();
    name = "Ajinkya";
    email = "ac.efg.com";
    imgurl = "https://picsum.photos/200/300";
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
