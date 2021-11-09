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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    name = user!.displayName.toString();
    email = user.email.toString();
    imgurl = user.photoURL.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('App ka Naam'),
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(imgurl),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: ListStudentPage(),
      drawer: MyDrawer(),
    );
  }
}
