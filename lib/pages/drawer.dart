import 'package:flutter/material.dart';

class DRawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Hello Ajinkya Patil "),
              CircleAvatar(
                backgroundColor: Colors.green.shade800,
                child: const Text('AJ'),
              )
            ],
          ),
        ),
      ],
    ));
  }
}