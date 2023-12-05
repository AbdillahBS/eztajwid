import 'package:eztajwid/views/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      },
    );
    return Scaffold(
        body: Container(
            height: double.infinity,
            child: Image.asset(
              "assets/images/splash.png",
              fit: BoxFit.cover,
            )));
  }
}
