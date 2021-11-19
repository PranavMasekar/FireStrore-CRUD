import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/pages/adduser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../database.dart';
import 'home.dart';
// import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  dynamic loading = "";
  Future<void> checkuserlog() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    print(user);
    if (user != null) {
      setState(() {
        Data.username = user.displayName.toString();
        Data.useremail = user.email.toString();
        Data.userimgurl = user.photoURL.toString();
        loading = true;
      });
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AddUser(),
          ),
        );
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();
    checkuserlog();
  }

  signInMethod() async {
    // await signin();
    if (await signin() != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AddUser(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading == false
        ? Scaffold(
            backgroundColor: Color(0xff1e192e),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Text("Shotro App",
                        style: TextStyle(color: Colors.white, fontSize: 40))),
                SizedBox(height: 50),
                Container(
                  child: Image.asset('assets/2.png'),
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
          )
        : SizedBox();
  }
}
