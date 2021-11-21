import 'package:flutter/material.dart';
import '../Components/Button.dart';
import '../database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class VisitStore extends StatefulWidget {
  @override
  State<VisitStore> createState() => _VisitStoreState();
}

class _VisitStoreState extends State<VisitStore> {
  Future<void> cancel() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Data.useremail)
        .set(
          {
            "mail": Data.useremail,
            "hotel": "",
          },
          SetOptions(merge: true),
        )
        .then((_) => {
              print(Data.hotelname),
              FirebaseFirestore.instance
                  .collection('Hotels')
                  .doc(Data.hotelname)
                  .update({"count": --Data.currentpeople})
            })
        .then(
          (value) => {
            setState(
              () {
                Data.hotelname = "";
              },
            )
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text(
          "Welcome",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${Data.hotelname}',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Container(
            child: Image.asset('assets/3.png'),
          ),
          Text(
            "After Completing your Work Press the Button Below",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Button(
            title: "DONE",
            press: () {
              // Data.hotelname = "";
              // await deleteCustomer();
              cancel();
            },
            replace: HomePage(),
          ),
        ],
      ),
    );
  }
}
