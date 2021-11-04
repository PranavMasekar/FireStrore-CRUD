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
      body: Center(
        child: SignInButton(
          Buttons.Google,
          onPressed: () {
            signInMethod();
          },
        ),
      ),
    );
  }
}
