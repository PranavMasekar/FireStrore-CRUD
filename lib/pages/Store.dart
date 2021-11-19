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
          store[0] == ""
              ? Column(
                  children: [
                    Center(
                        child: Text(
                      "No Store Found!!",
                      style: TextStyle(color: Colors.white),
                    )),
                    Button(title: "Create Your Store", push: QRCodeGenerator())
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
                                "Store Name : ${store[0]}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              SizedBox(height: 20),
                              Center(
                                  child: Text(
                                "Person Count : ${store[1]}",
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
                      data: store[0],
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Button(
                            title: "Remove The Store",
                            press: () => {
                                  setState(() {
                                    store[0] = "";
                                    store[1] = 0;
                                  })
                                }),
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
