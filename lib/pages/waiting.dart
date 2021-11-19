import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';
import '../Components/Button.dart';

class WaitingPage extends StatefulWidget {
  final String store;
  WaitingPage({required this.store});
  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  final count = 5;
  final waiting = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Waiting Room'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.store,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Container(child: Image.asset('assets/1.png')),
          Text(
            "Maximum Store Member Count : $count",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Current Waiting People : $waiting",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button(title: "Leave the Queue", push: HomePage()))
        ],
      ),
    );
  }
}
