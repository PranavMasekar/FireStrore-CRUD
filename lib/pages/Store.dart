import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Store extends StatelessWidget {
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
                ? Center(
                    child: Text(
                    "No Store Found!!",
                    style: TextStyle(color: Colors.white),
                  ))
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
                    ],
                  )
          ],
        ));
  }
}
