import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firestore_project/pages/addstudent.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> checkuserlog() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      name = user.displayName.toString();
      email = user.email.toString();
      imgurl = user.photoURL.toString();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  signInMethod() async {
    await signin();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudentPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkuserlog();
  }

  //Call the signInMethod function on tap.
  //SignInButton(Buttons.Google, onPressed: () {
  //             signInMethod();
  //           })
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff89e1b1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: IconButton(
                onPressed: () => {},
                iconSize: 30,
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                )),
          ),
          Container(
            child: Text("Hi\nTo Continue, Register First",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
          ),
          Center(
            child: SignInButton(
              Buttons.Google,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5.0),
              ),
              onPressed: () {
                signInMethod();
              },
            ),
          ),
        ],
      ),
    );
  }
}
