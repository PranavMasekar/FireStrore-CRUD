import 'package:flutter/material.dart';
import 'addstudent.dart';
import 'liststudent.dart';
import 'drawer.dart';
import 'profilePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var login = false;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('App ka Naam'),
              login
                  ? IconButton(
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
                  : ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddStudentPage(),
                          ),
                        ),
                      },
                      child: Text(
                        "REGISTER HERE",
                        style: TextStyle(fontSize: 15),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
            ],
          ),
        ),
        body: ListStudentPage(),
        drawer: MyDrawer());
  }
}
