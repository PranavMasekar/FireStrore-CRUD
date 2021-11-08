import 'package:flutter/material.dart';

class VisitStore extends StatelessWidget {
  final count = 5;
  final waiting = 7;
  final String store;
  VisitStore({required this.store});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1e192e),
        appBar: AppBar(
          backgroundColor: Color(0xff372e4a),
          title: Text("Waiting Room"),
        ),
        body: Column(
          children: [
            Text(
              "Current Store Member Count is $count",
              style: TextStyle(color: Colors.white),
            ),
            
            Text(
              "Current Waiting People : $waiting",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Store Name : $store",
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'Stay in Queue',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0cecda),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      'Leave the Queue',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0cecda),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
