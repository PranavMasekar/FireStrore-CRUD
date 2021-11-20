import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';
import '../Components/Button.dart';
import '../Authentication/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../database.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  Future<void> addUserData() async {
    FirebaseFirestore.instance.collection('users').doc(Data.useremail).set(
      {
        "mail": Data.useremail,
        "accum": Data.maxpeople,
        "myhotel": Data.myhotel,
      },
      SetOptions(merge: true),
    ).then((value) => print("added"));
  }

  TextEditingController controller = TextEditingController();
  TextEditingController people = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ADD YOUR STORE'),
          ],
        ),
      ),
      backgroundColor: Color(0xff1e192e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // controller.text == ""
            //     ? Text(
            //         "Add The Name of the Hotel",
            //         style: TextStyle(color: Colors.white),
            //       )
            //     : BarcodeWidget(
            //         barcode: Barcode.qrCode(),
            //         color: Colors.white,
            //         data: controller.text,
            //         width: 200,
            //         height: 200,
            //       ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Theme(
                  data: ThemeData.dark(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Enter the name of Hotel',
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Theme(
                  data: ThemeData.dark(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      // widget.stored[1].toString()
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      controller: people,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) < 0) {
                          return 'Please Enter Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'People you can Accomodate',
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Button2(
                  title: "Create Store",
                  press: () {
                    setState(
                      () {},
                    );
                    Data.myhotel = controller.text.toString();
                    Data.maxpeople = int.parse(people.text);
                    addUserData();
                  },
                  replace: HomePage(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
