import 'package:firestore_project/pages/home.dart';
import 'package:flutter/material.dart';

class VisitStore extends StatefulWidget {
  final String store;
  VisitStore({required this.store});

  @override
  State<VisitStore> createState() => _VisitStoreState();
}

class _VisitStoreState extends State<VisitStore> {
  int count = 0;

  int waiting = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      appBar: AppBar(
        backgroundColor: Color(0xff372e4a),
        title: Text(
          "Waiting Room",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Current Store Member Count is $count",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Current Waiting People : $waiting",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "Store Name : ${widget.store}",
            style: TextStyle(color: Colors.white, fontSize: 18),
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
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    ),
                  },
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
      ),
    );
  }
}
