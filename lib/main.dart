import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:firestore_project/pages/home.dart';
// import 'package:firestore_project/pages/adduser.dart';
import 'package:firestore_project/pages/login.dart';
=======
import 'package:firestore_project/pages/adduser.dart';
import 'package:firestore_project/pages/home.dart';
>>>>>>> 0cad004499fca8ca65b247ed910a8e4c5b85d9d4
// import 'package:firestore_project/pages/home.dart';
// import 'package:firestore_project/pages/QRCodeScanner.dart';
// import 'package:firestore_project/pages/QRCodeScanner.dart';
import 'package:flutter/material.dart';
// import 'pages/login.dart';
// import 'pages/QRCodeGenerator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initilization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('ERROR');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return MaterialApp(
          title: 'FireStore',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
<<<<<<< HEAD
          routes: {"/home": (context) => HomePage()},
          home: LoginPage(),
=======
          home: HomePage(),
>>>>>>> 0cad004499fca8ca65b247ed910a8e4c5b85d9d4
        );
      },
    );
  }
}
