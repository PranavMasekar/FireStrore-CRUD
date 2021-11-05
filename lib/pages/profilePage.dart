import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Profile Page'),
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: CircleAvatar(
                  backgroundColor: Color(0xffff0000),
                  radius: 50,
                  child: const Text('AJ'),
                ),
              ),
            ),
            Center(
                child: new Text(
              "Ajinkya Patil",
              style: (TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )),
            new Text("Covid Vaccine Status : 2"),
          ],
        ));
  }
}
