// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'VisitStore.dart';
// import '../Components/Button.dart';

// class ListStudentPage extends StatefulWidget {
//   final Map info;

//   const ListStudentPage({Key? key, required this.info}) : super(key: key);
//   @override
//   _ListStudentPageState createState() => _ListStudentPageState();
// }

// class _ListStudentPageState extends State<ListStudentPage> {
//   CollectionReference students =
//       FirebaseFirestore.instance.collection('students');
//   Future<void> addUser() {
//     return students.add(
//       {
//         // 'name': info[],
//         // 'number': number,
//         // 'doses': doses,
//       },
//     );
//   }

//   // Future getCount() async => FirebaseFirestore.instance
//   //         .collection('students') //your collectionref
//   //         .where('deleted', isEqualTo: false)
//   //         .get()
//   //         .then((value) {
//   //       var count = 0;
//   //       count = value.docs.length;

//   //       return count;
//   //     });
//   final Stream<QuerySnapshot> studentStream =
//       FirebaseFirestore.instance.collection('students').snapshots();

//   // Future<void> deleteUser(id) {
//   //   return students
//   //       .doc(id)
//   //       .delete()
//   //       .catchError((error) => print("Failed to delete user"));
//   // }

//   late String qrcode;
//   bool scanned = false;
//   Future<void> scanQRCode() async {
//     try {
//       final qrCode = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666',
//         'Cancel',
//         true,
//         ScanMode.QR,
//       );
//       if (mounted) {
//         setState(() {
//           qrcode = qrCode;
//           scanned = true;
//         });
//       }
//     } on Error {
//       qrcode = 'Failed To Scan';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: studentStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           print('ERROR');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         final List store = [];
//         snapshot.data!.docs.map((DocumentSnapshot document) {
//           Map a = document.data() as Map<String, dynamic>;
//           store.add(a);
//           a['id'] = document.id;
//         }).toList();

//         return Container(
//           color: Color(0xff1e192e),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // Text(getCount().toString(),style: TextStyle(color: Colors.white),),
//               Column(
//                 children: [
//                   Container(child: Image.asset('assets/4.png')),
//                   Center(
//                     child: Button(
//                       title: "Scan QR Code",
//                       press: () => scanQRCode(),
//                     ),
//                   ),
//                   // Center(
//                   //     child: Button(
//                   //         title: 'Create QR Code', push: QRCodeGenerator())),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey, width: 0.0),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: scanned && qrcode != "-1"
//                       ? Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 "Store Name: " + qrcode,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 20),
//                               ),
//                               SizedBox(height: 20),
//                               Container(
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             WidgetsBinding.instance!
//                                                 .addPostFrameCallback((_) {
//                                               Navigator.pushReplacementNamed(
//                                                   context, "/home",
//                                                   arguments: {
//                                                     // "name": inf,
//                                                     // "doses": doses,
//                                                     // "number": number,
//                                                   });
//                                             });
//                                           },
//                                           child: Text(
//                                             'Submit',
//                                             style: TextStyle(fontSize: 18.0),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 150,
//                                           child: Button(
//                                             title: 'Cancel',
//                                             press: () => {
//                                               setState(
//                                                 () {
//                                                   qrcode = "";
//                                                   scanned = false;
//                                                 },
//                                               )
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 20),
//                                     Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Button(
//                                               title: 'Visit The Store',
//                                               push: VisitStore()),
//                                           SizedBox(
//                                             width: 150,
//                                             child: Button(
//                                               title: 'Cancel',
//                                               press: () => {
//                                                 setState(
//                                                   () {
//                                                     qrcode = "";
//                                                     scanned = false;
//                                                   },
//                                                 ),
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       : SizedBox(),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
