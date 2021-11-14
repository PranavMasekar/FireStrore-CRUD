// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/Components/Button.dart';
import 'package:firestore_project/pages/waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'QRCodeGenerator.dart';
import 'VisitStore.dart';
// import 'liststudent.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> addUser(String myname, String number, String doses, int x,
      String hotelname) async {
    CollectionReference data = FirebaseFirestore.instance.collection(hotelname);
    if (x < 5) {
      data
          .add(
            {
              'name': myname,
              'number': number,
              'doses': doses,
            },
          )
          .then((value) => print('User Added'))
          .onError(
            (error, stackTrace) => print("Error"),
          );
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VisitStore(store: qrcode),
          ),
        );
      });
    } else {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WaitingPage(),
          ),
        );
      });
    }
  }

  late String qrcode;

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
          qrcode = qrCode;
          scanned = true;
        });
      }
    } on Error {
      qrcode = 'Failed To Scan';
    }
  }

  @override
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      name = user.displayName.toString();
      email = user.email.toString();
      imgurl = user.photoURL.toString();
    } else {
      name = "NOT FOUND";
      email = "NOT FOUND";
    }
  }

  @override
  Widget build(BuildContext context) {
    final info =
        (ModalRoute.of(context)!.settings.arguments as Map<String, String>);
    print(info["name"]);
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
          final List store = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            store.add(a);
            a['id'] = document.id;
          }).toList();

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
                                  "Store Name: " + qrcode,
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
                                                addUser(
                                                    info['name'].toString(),
                                                    info['number'].toString(),
                                                    info['doses'].toString(),
                                                    store.length,
                                                    qrcode);
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
