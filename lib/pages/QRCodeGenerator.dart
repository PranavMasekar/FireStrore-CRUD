import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../Components/Button.dart';
import '../Authentication/auth.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  TextEditingController controller = TextEditingController();
  TextEditingController people = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.text == ""
                ? Text(
                    "Add The Name of the Hotel",
                    style: TextStyle(color: Colors.white),
                  )
                : BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  color: Colors.white,
                  data: controller.text,
                  width: 200,
                  height: 200,
                ),
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
                      keyboardType: TextInputType.number,
                      autofocus: false,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      controller: people,
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
                  title: "Create QR Now",
                  press: () {
                    setState(
                      () {},
                    );
                    store = controller.text.toString();
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
