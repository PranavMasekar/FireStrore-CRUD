import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firestore_project/pages/QRCodeScanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'VisitStore.dart';
// import 'UpdateStudentPage.dart';
import './QRCodeGenerator.dart';

class ListStudentPage extends StatefulWidget {
  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection('students').snapshots();
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    return students
        .doc(id)
        .delete()
        .catchError((error) => print("Failed to delete user"));
  }

  late String qrcode;
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
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => {scanQRCode()},
                          child: Text(
                            'Scan QR Code',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0cecda),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QRCodeGenerator(),
                              ),
                            )
                          },
                          child: Text(
                            'Create QR Code',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0cecda),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                                Text("Store Name: " + qrcode,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                SizedBox(height: 20),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VisitStore(store: qrcode),
                                            ),
                                          )
                                        },
                                        child: Text(
                                          'Visit The Store',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xff0cecda),
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () => {
                                            setState(() {
                                              qrcode = "";
                                              scanned = false;
                                            })
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: Color(0xff0cecda),
                                            shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox()),
              ),

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
              //     child: Table(
              //       border: TableBorder.all(),
              //       columnWidths: const <int, TableColumnWidth>{
              //         1: FixedColumnWidth(140),
              //       },
              //       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //       children: [
              //         TableRow(
              //           children: [
              //             TableCell(
              //               child: Container(
              //                 color: Colors.greenAccent,
              //                 child: Center(
              //                   child: Text(
              //                     'Name',
              //                     style: TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             TableCell(
              //               child: Container(
              //                 color: Colors.greenAccent,
              //                 child: Center(
              //                   child: Text(
              //                     'Email',
              //                     style: TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             TableCell(
              //               child: Container(
              //                 color: Colors.greenAccent,
              //                 child: Center(
              //                   child: Text(
              //                     'Action',
              //                     style: TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //         for (var i = 0; i < store.length; i++) ...[
              //           TableRow(
              //             children: [
              //               TableCell(
              //                 child: Center(
              //                   child: Text(
              //                     store[i]['name'],
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(fontSize: 18),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                 child: Center(
              //                   child: Text(
              //                     store[i]['email'],
              //                     overflow: TextOverflow.ellipsis,
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(fontSize: 18),
              //                   ),
              //                 ),
              //               ),
              //               TableCell(
              //                   child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   IconButton(
              //                     onPressed: () => {
              //                       Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                           builder: (context) =>
              //                               UpdateStudentPage(id: store[i]['id']),
              //                         ),
              //                       ),
              //                     },
              //                     icon: Icon(
              //                       Icons.edit,
              //                       color: Colors.orange,
              //                     ),
              //                   ),
              //                   IconButton(
              //                       onPressed: () => {
              //                             deleteUser(
              //                               store[i]['id'],
              //                             ),
              //                           },
              //                       icon: Icon(
              //                         Icons.delete,
              //                         color: Colors.red,
              //                       ))
              //                 ],
              //               ))
              //             ],
              //           ),
              //         ],
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
