import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_project/Authentication/auth.dart';
import 'package:firestore_project/pages/adduser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
// import 'package:firestore_project/pages/adduser.dart';
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
    final user = auth.currentUser;
    if (user != null) {
      setState(() {
        // name = user.displayName.toString();
        // email = user.email.toString();
        // imgurl = user.photoURL.toString();
        name = "Ajinkya";
        email = "ac.efg.com";
        imgurl = "https://picsum.photos/200/300";
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
        builder: (context) => AddUser(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e192e),
      body: Stack(
        children: [
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: WaveWidget(
          //     duration: 1,
          //     config: CustomConfig(
          //       gradients: [
          //         [Color(0xff372e4a), Color(0xFF3A2DB1)],
          //         [Color(0xFFEC72EE), Color(0xff372e4a)],
          //         [Color(0xff372e4a), Color(0xFF00dbde)],
          //         [Color(0xFF396afc), Color(0xff372e4a)]
          //       ],
          //       durations: [35000, 19440, 10800, 6000],
          //       heightPercentages: [0.20, 0.23, 0.25, 0.30],
          //       blur: MaskFilter.blur(BlurStyle.inner, 5),
          //       gradientBegin: Alignment.centerLeft,
          //       gradientEnd: Alignment.centerRight,
          //     ),
          //     waveAmplitude: 1.0,
          //     backgroundColor: Color(0xff1e192e),
          //     size: Size(double.infinity, 500),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text("Shotro App",
                      style: TextStyle(color: Colors.white, fontSize: 40))),
              SizedBox(height: 50),
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
    );
  }
}
