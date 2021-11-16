import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';
import '../Components/Button.dart';

class VisitStore extends StatefulWidget {
  final String store;
  VisitStore({required this.store});

  @override
  State<VisitStore> createState() => _VisitStoreState();
}

class _VisitStoreState extends State<VisitStore> {
  final count = 5;
  final waiting = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text(
          "Welcome",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.store,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Container(
            child: Image.asset('assets/3.png'),
          ),
          Text(
            "After Completing your Work Press the Button Below",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Button(
            title: "DONE",
            replace: HomePage(),
          )
        ],
      ),
    );
  }
}
