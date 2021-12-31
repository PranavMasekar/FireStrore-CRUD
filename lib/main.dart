// ignore_for_file: avoid_print, non_constant_identifier_names, unused_field
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_project/Testing%20folder/testhome.dart';
import 'package:firestore_project/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'dart:async';

import 'Authentication/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MYHOME(),
    );
  }
}

class MYHOME extends StatefulWidget {
  const MYHOME({Key? key}) : super(key: key);

  @override
  State<MYHOME> createState() => _MYHOMEState();
}

class _MYHOMEState extends State<MYHOME> {
  Future<void> checkuserlog() async {
    dynamic loading = "";
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TestHome()));
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

  signInMethod(context) async {
    await signin();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    Data.username = user!.displayName.toString();
    Data.useremail = user.email.toString();
    Data.userimgurl = user.photoURL.toString();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TestHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Auth example'),
      ),
      body: Center(
        child: SignInButton(
          Buttons.Google,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          onPressed: () {
            signInMethod(context);
          },
        ),
      ),
    );
  }
}
