import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/pages/QRCodeGenerator.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../Components/Button.dart';

class Store extends StatefulWidget {
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
            store == ""
                ? Column(
                    children: [
                      Center(
                          child: Text(
                        "No Store Found!!",
                        style: TextStyle(color: Colors.white),
                      )),
                      Button(
                          title: "Create Your Store", push: QRCodeGenerator())
                    ],
                  )
                : Column(
                    children: [
                      Center(
                          child: Text(
                        "Store Name : $store",
                        style: TextStyle(color: Colors.white),
                      )),
                      Center(
                          child: Text(
                        "Your QR Code",
                        style: TextStyle(color: Colors.white),
                      )),
                      BarcodeWidget(
                        barcode: Barcode.qrCode(),
                        color: Colors.white,
                        data: store,
                        width: 200,
                        height: 200,
                      ),
                      Button(
                          title: "Remove The Store",
                          press: () => {
                                setState(() {
                                  store = "";
                                })
                              }),
                    ],
                  )
          ],
        ));
  }
}
