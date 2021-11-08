import 'package:flutter/material.dart';
// import 'addstudent.dart';
import 'liststudent.dart';
import 'drawer.dart';
import 'profilePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('App ka Naam'),
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.green.shade800,
                child: const Text('AJ'),
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
      drawer: MyDrawer(),
    );
  }
}
