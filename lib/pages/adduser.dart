// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firestore_project/pages/home.dart';
// import 'package:flutter/material.dart';

// import '../database.dart';
// import 'home.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// class AddUser extends StatefulWidget {
//   @override
//   _AddUserState createState() => _AddUserState();
// }

// class _AddUserState extends State<AddUser> {
//   final _formKey = GlobalKey<FormState>();
//   var name = "";
//   var number = "";
//   var doses = "";

//   final namecontrl = TextEditingController();
//   final numbercontrl = TextEditingController();
//   final dosecontrl = TextEditingController();

//   @override
//   void dispose() {
//     namecontrl.dispose();
//     numbercontrl.dispose();
//     dosecontrl.dispose();
//     super.dispose();
//   }

//   clearText() {
//     namecontrl.clear();
//     numbercontrl.clear();
//     dosecontrl.clear();
//   }

//   // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   // late Future<int> _counter;

//   // Future<void> _incrementCounter() async {
//   //   final SharedPreferences prefs = await _prefs;
//   //   final int counter = (prefs.getInt('counter') ?? 0) + 1;

//   //   setState(() {
//   //     _counter = prefs.setInt('counter', counter).then((bool success) {
//   //       return counter;
//   //     });
//   //   });
//   // }

//   // void initState() {
//   //   super.initState();
//   //   _counter = _prefs.then((SharedPreferences prefs) {
//   //     return prefs.getInt('counter') ?? 0;
//   //   });
//   // }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff1e192e),
//       appBar: AppBar(
//         backgroundColor: Color(0xff372e4a),
//         title: Text("Fill Your Information"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//           child: ListView(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10.0),
//                 child: TextFormField(
//                   style: TextStyle(color: Colors.white),
//                   autofocus: false,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 0.0),
//                     ),
//                     border: OutlineInputBorder(),
//                     errorStyle:
//                         TextStyle(color: Colors.redAccent, fontSize: 15),
//                   ),
//                   controller: namecontrl,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Name';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10.0),
//                 child: TextFormField(
//                   style: TextStyle(color: Colors.white),
//                   autofocus: false,
//                   decoration: InputDecoration(
//                     labelText: 'Phone Number',
//                     labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 0.0),
//                     ),
//                     border: OutlineInputBorder(),
//                     errorStyle:
//                         TextStyle(color: Colors.redAccent, fontSize: 15),
//                   ),
//                   controller: numbercontrl,
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter Phone Number';
//                     } else if (value.length != 10) {
//                       return 'Please Enter Valid Phone Number';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(color: Colors.white),
//                   autofocus: false,
//                   decoration: InputDecoration(
//                     labelText: 'Number Of Doses',
//                     labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
//                     enabledBorder: const OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.grey, width: 0.0),
//                     ),
//                     border: OutlineInputBorder(),
//                     errorStyle:
//                         TextStyle(color: Colors.redAccent, fontSize: 15),
//                   ),
//                   controller: dosecontrl,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please Enter doses';
//                     }
//                     if (int.parse(value) > 2 || int.parse(value) < 0) {
//                       return 'Please Enter Correct Number of doses';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               Container(
//                 child: new Text(
//                   "To Enter the Store you need to have atlease 1 Dose of COVID-19 Vaccine",
//                   style: TextStyle(color: Colors.red.withOpacity(1)),
//                 ),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Validate returns true if the form is valid, otherwise false.
//                         if (_formKey.currentState!.validate()) {
//                           setState(() {
//                             Data.name = namecontrl.text;
//                             Data.number = numbercontrl.text;
//                             Data.doses = dosecontrl.text;
//                             clearText();
//                           });
//                           WidgetsBinding.instance!.addPostFrameCallback((_) {
//                             Navigator.pushReplacementNamed(
//                               context,
//                               "/home",
//                             );
//                           });
//                         }
//                       },
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () => {
//                         clearText(),
//                       },
//                       child: Text(
//                         'Reset',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                       style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(
//               //   child: Column(
//               //     children: [
//               //       Text("Only For Devlopers !!"),
//               //       ElevatedButton(
//               //         onPressed: () => {
//               //           Navigator.pushReplacement(
//               //             context,
//               //             MaterialPageRoute(
//               //               builder: (context) => HomePage(),
//               //             ),
//               //           )
//               //         },
//               //         child: Text(
//               //           'PASS',
//               //           style: TextStyle(fontSize: 18.0),
//               //         ),
//               //         style: ElevatedButton.styleFrom(primary: Colors.red),
//               //       ),
//               //     ],
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
