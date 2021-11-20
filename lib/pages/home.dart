import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_project/Components/Button.dart';
// import 'package:firestore_project/pages/waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../database.dart';
import 'QRCodeGenerator.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> addUser(int x) async {
    DocumentSnapshot<Map<String, dynamic>> mydoc = await FirebaseFirestore
        .instance
        .collection('Hotel')
        .doc(Data.hotelname)
        .get();

    print(mydoc.data()?["Customers"].length);

    FirebaseFirestore.instance.collection('Hotels').doc(Data.hotelname).set(
      {
        "Customers": FieldValue.arrayUnion(
          [
            {
              "name": Data.name,
              "number": Data.number,
              "doses": Data.doses,
            },
          ],
        ),
      },
      SetOptions(merge: true),
    ).then((value) => print("added"));
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   Navigator.of(context).pushNamed(
    //     "/store",
    //   );
    // });
  }

  String qrcode = "";

  final Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection('Hotel Vista').snapshots();

  bool scanned = false;
  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (mounted) {
        setState(() {
          Data.hotelname = qrCode;
          scanned = true;
        });
      }
    } on Error {
      qrcode = 'Failed To Scan';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(Data.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text('Safe Restro'),
      ),
      drawer: MyDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: studentStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('ERROR');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            color: Color(0xff1e192e),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text(getCount().toString(),style: TextStyle(color: Colors.white),),
                Column(
                  children: [
                    Center(
                      child: Button(
                        title: "Scan QR Code",
                        press: () => scanQRCode(),
                      ),
                    ),
                    Center(
                      child: Button(
                        title: 'Create QR Code',
                        push: QRCodeGenerator(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: scanned && qrcode != "-1"
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "Store Name: " + Data.hotelname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xff0cecda),
                                                shape:
                                                    new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                              onPressed: () {
                                                addUser(5);
                                              },
                                              child: Text(
                                                "Visit The Store",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Button(
                                                title: 'Cancel',
                                                press: () => {
                                                  setState(
                                                    () {
                                                      qrcode = "";
                                                      scanned = false;
                                                    },
                                                  ),
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
