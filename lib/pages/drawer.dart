import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello $name "),
                CircleAvatar(
                  backgroundColor: Colors.green.shade800,
                  child: Image.network(imgurl),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
