  import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_project/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_project/pages/QRCodeScanner.dart';
// import 'package:firestore_project/pages/QRCodeScanner.dart';
// import 'package:firestore_project/pages/home.dart';
// import 'package:firestore_project/pages/login.dart';
import 'package:flutter/material.dart';

// import 'pages/QRCodeGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          home: QRCodeScanner(),
        );
      },
    );
  }
}
