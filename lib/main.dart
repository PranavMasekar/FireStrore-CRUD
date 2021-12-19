// ignore_for_file: avoid_print, non_constant_identifier_names, unused_field
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _status = '';
  void authenticate(String URL) async {
    const callbackUrlScheme = "pranavapp.page.link";
    try {
      final result = await FlutterWebAuth.authenticate(
          url: URL, callbackUrlScheme: callbackUrlScheme);
      final code = Uri.parse(result).queryParameters['code'];
      print(code);
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Got error: $e';
      });
    }
  }

  Future<void> get_request() async {
    var url = Uri.parse(
        "http://913d-2401-4900-5033-eb92-1d68-513b-3715-5571.ngrok.io/auth/o/google-oauth2/?redirect_uri=http://913d-2401-4900-5033-eb92-1d68-513b-3715-5571.ngrok.io");
    var response = await http.get(url);
    Map data = jsonDecode(response.body);
    print(data["authorization_url"]);
    authenticate(data["authorization_url"]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Web Auth example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 80),
              ElevatedButton(
                child: const Text('Authenticate'),
                onPressed: () {
                  get_request();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
