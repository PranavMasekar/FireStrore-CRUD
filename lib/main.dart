import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_project/pages/VisitStore.dart';
import 'package:firestore_project/pages/home.dart';
import 'package:firestore_project/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            "/home": (context) => HomePage(),
            "/store": (context) => VisitStore(),
          },
          home: LoginPage(),
        );
      },
    );
  }
}
