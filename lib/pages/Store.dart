import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/database.dart';
import 'package:firestore_project/pages/QRCodeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../Components/Button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store extends StatefulWidget {
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  // dynamic hotelInfo = "";
  Future<void> getUser() async {
    FirebaseFirestore.instance
        .collection("users")
        .where('mail', isEqualTo: Data.useremail)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        setState(() {
          Data.myhotel = result.data()['myhotel'];
          Data.maxpeople = result.data()['accum'];
        });
      });
    });
    // DocumentSnapshot<Map<String, dynamic>> mydoc = await FirebaseFirestore
    //     .instance
    //     .collection('users')
    //     .doc(Data.useremail)
    //     .get();

    // print(mydoc);

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Navigator.of(context).pushNamed(
    //     "/store",
    //   );
    // });
  }

  void initState() {
    super.initState();
    getUser();
  }

  Future<void> deleteUserData() async {
    FirebaseFirestore.instance.collection('users').doc(Data.useremail).set(
      {
        "accum": "",
        "myhotel": "",
      },
      SetOptions(merge: true),
    ).then((value) => {
          setState(() => {Data.myhotel = "", Data.maxpeople = 1})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Your Store'),
          ],
        ),
      ),
      body: ListView(
        children: [
          Data.myhotel == ""
              ? Column(
                  children: [
                    Center(
                        child: Text(
                      "No Store Found!!",
                      style: TextStyle(color: Colors.white),
                    )),
                    Button(title: "Create Your Store", push: QRCodeGenerator()),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                                  child: Text(
                                "Store Name : ${Data.myhotel}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              SizedBox(height: 20),
                              Center(
                                  child: Text(
                                "Person Count : ${Data.maxpeople}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                        child: Text(
                      "Your QR Code",
                      style: TextStyle(color: Colors.white),
                    )),
                    SizedBox(height: 20),
                    BarcodeWidget(
                      barcode: Barcode.qrCode(),
                      color: Colors.white,
                      data: Data.myhotel,
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                            title: "Remove The Store",
                            press: () => {deleteUserData()}),
                        Button(
                          title: "Update Your Data",
                          push: QRCodeGenerator(),
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
