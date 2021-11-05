import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              color: Colors.white,
              data: controller.text,
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData.dark(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        onChanged: (_) => setState(
                          () {},
                        ),
                        autofocus: false,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Enter the name of Hotel',
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    )
                  },
                  child: Icon(Icons.check),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
