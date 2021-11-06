import 'package:flutter/material.dart';

class VisitStore extends StatelessWidget {
  var count = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Waiting Room"),
        ),
        body: Column(
          children: [
            Text("Current Store Member Count is $count"),
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
