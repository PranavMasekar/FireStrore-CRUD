import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> deleteCustomer() async {
    List val = [FirebaseAuth.instance.currentUser!.uid];
    await FirebaseFirestore.instance
        .collection('Hotels')
        .doc(Data.hotelname)
        .update(
      {"Customers": FieldValue.arrayRemove(val)},
    ).then(
      (value) => print("Deleted"),
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
          // Text(
          //   "Store Name : ${Data.hotelname}",
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // Padding(
          //     //   padding: const EdgeInsets.all(8.0),
          //     //   child: Button(title: "Stay in Queue"),
          //     // ),
          //     // Padding(
          //     //   padding: const EdgeInsets.all(8.0),
          //     //   child: ElevatedButton(
          //     //     style: ElevatedButton.styleFrom(
          //     //         primary: Color(0xff0cecda),
          //     //         shape: new RoundedRectangleBorder(
          //     //           borderRadius: new BorderRadius.circular(30.0),
          //     //         )),
          //     //     onPressed: () {
          //     //       // Validate returns true if the form is valid, otherwise false.

          //     //       WidgetsBinding.instance!.addPostFrameCallback((_) {
          //     //         Navigator.pushReplacementNamed(
          //     //           context,
          //     //           "/home",
          //     //         );
          //     //       });
          //     //     },
          //     //     child: Text(
          //     //       'Leave the queue',
          //     //       style: TextStyle(fontSize: 18.0, color: Colors.black),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // )
        ],
      ),
    );
  }
}
