import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/pages/Store.dart';
import 'package:flutter/material.dart';
import 'package:firestore_project/pages/login.dart';
import '../Components/Button.dart';
import '../database.dart';

class MyDrawer extends StatelessWidget {
  signOutMethod(context) async {
    await signout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Color(0xff372e4a),
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(Data.userimgurl),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${Data.username} ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "${Data.useremail} ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Button2(
                  title: "Logout",
                  press: () => {
                        signOutMethod(context),
                        store = {0: "", 1: 0}
                      }),
              Button2(title: "My Hotel or Store", push: Store())
            ],
          ),
        ),
      ),
    );
  }
}
