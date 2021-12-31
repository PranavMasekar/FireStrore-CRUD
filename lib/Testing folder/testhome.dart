import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  String id_token = "Id Token Ayega";
  Future<String> getid() async {
    id_token = await FirebaseAuth.instance.currentUser!.getIdToken();
    print("araha");
    print(id_token.length);
    setState(() {});
    return id_token;
  }

  @override
  void initState() {
    super.initState();
    getid();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Authentication"),
        ),
        body: Column(
          children: [
            Center(
              child: Text(getid().toString()),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("SignOut"),
            ),
          ],
        ),
      ),
    );
  }
}
