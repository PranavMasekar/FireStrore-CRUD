import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1e192e),
        appBar: AppBar(
          backgroundColor: Color(0xff372e4a),
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
                  backgroundImage:
                      NetworkImage("https://picsum.photos/1000/1000"),
                  radius: 50,
                ),
              ),
            ),
            Center(
                child: new Text(
              "Ajinkya Patil",
              style: (TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
            )),
            Row(
              children: [
                Text("Covid Vaccine Status : 2",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            )
          ],
        ));
  }
}
