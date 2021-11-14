import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final dynamic push, press, replace;
  Button(
      {required this.title,
      this.push = "",
      this.press = "",
      this.replace = ""});
  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: () => {
        if (push != "")
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => push,
              ),
            ),
          },
        if (replace != "")
          {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => replace,
              ),
            ),
          },
        if (press != "") press(),
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          primary: Color(0xff0cecda),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
    ));
  }
}

class Button2 extends StatelessWidget {
  final String title;
  final dynamic push, press, replace;
  Button2(
      {required this.title,
      this.push = "",
      this.press = "",
      this.replace = ""});
  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: () => {
        if (push != "")
          {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => push,
              ),
            ),
          },
        if (replace != "")
          {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => replace,
              ),
            ),
          },
        if (press != "") press(),
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.white),
    ));
  }
}
