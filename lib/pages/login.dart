import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firestore_project/pages/addstudent.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> checkuserlog() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser;
    if (user != null) {
      setState(() {
        name = user.displayName.toString();
        email = user.email.toString();
        imgurl = user.photoURL.toString();
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }

  void initState() {
    super.initState();
    checkuserlog();
  }

  signInMethod() async {
    await signin();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddStudentPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: WaveWidget(
              duration: 1,
              config: CustomConfig(
                gradients: [
                  [Color(0xff372e4a), Color(0xFF3A2DB1)],
                  [Color(0xFFEC72EE), Color(0xff372e4a)],
                  [Color(0xff372e4a), Color(0xFF00dbde)],
                  [Color(0xFF396afc), Color(0xff372e4a)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.inner, 5),
                gradientBegin: Alignment.centerLeft,
                gradientEnd: Alignment.centerRight,
              ),
              waveAmplitude: 1.0,
              backgroundColor: Color(0xff1e192e),
              size: Size(double.infinity, 200.0),
            ),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xff372e4a),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: Text(
                                        " Create Account",
                                        style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 25),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "To Continue, Register First",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: IconButton(
                                    onPressed: () => {},
                                    iconSize: 50,
                                    icon: Icon(
                                      Icons.login,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff372e4a),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          " Super Fast",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () => {},
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.fast_forward_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff372e4a),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          " Access from Anywhere",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () => {},
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff372e4a),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          " Lower Risk Factor",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () => {},
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.sanitizer,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff372e4a),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          " User Friendly",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                      onPressed: () => {},
                                      iconSize: 20,
                                      icon: Icon(
                                        Icons.phone_android,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xff372e4a),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          " Saves Your Time",
                                          style: TextStyle(
                                              color: Color(0xffffffff),
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: IconButton(
                                        onPressed: () => {},
                                        iconSize: 20,
                                        icon: Icon(
                                          Icons.timer,
                                          color: Colors.grey,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: SignInButton(
                          Buttons.Google,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          onPressed: () {
                            signInMethod();
                          },
                        ),
                      ),
                    ],
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
