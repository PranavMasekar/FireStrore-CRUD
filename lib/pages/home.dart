import 'package:flutter/material.dart';
import 'addstudent.dart';
import 'liststudent.dart';
import 'drawer.dart';
import 'profilePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff372e4a),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('App ka Naam'),
              IconButton(
                icon: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/200/200"),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: ListStudentPage(),
        drawer: MyDrawer());
  }
}
