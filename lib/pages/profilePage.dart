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
      body : ListView(
        children: [
          new Text("Name : Ajinkya Patil"),
          new Text("Covid Vaccine Status : 2")
        ],
      )
    );
  }
}
