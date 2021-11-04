import 'package:flutter/material.dart';
import 'addstudent.dart';
import 'liststudent.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Firestore CRUD'),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStudentPage(),
                    ),
                  ),
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              ),
            ],
          ),
        ),
        body: ListStudentPage(),
        drawer: MyDrawer());
  }
}
