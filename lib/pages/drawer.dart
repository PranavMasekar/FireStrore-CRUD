import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:firestore_project/pages/login.dart';
import 'profilePage.dart';

class MyDrawer extends StatelessWidget {
  signOutMethod() async {
    await signout();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello $name "),
                    CircleAvatar(
                      backgroundColor: Colors.green.shade800,
                      child: Image.network(imgurl),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: ElevatedButton(
            onPressed: () => {print("Logout")},
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
        )
      ]),
    );
  }
}
