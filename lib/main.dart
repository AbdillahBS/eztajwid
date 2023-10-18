import 'package:eztajwid/navbar.dart';
import 'package:eztajwid/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'mooli',
          bottomAppBarTheme: BottomAppBarTheme(
            color: Color.fromARGB(255, 220, 223, 245),
          ),
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
            foregroundColor: Color.fromARGB(255, 0, 78, 203),
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 220, 223, 245),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          // '/home':(context) => Home(),
          // '/materi':(context) => Materi(),
          // '/quran':(context) => quran(),
          // '/compas':(context) => compas(),
          '/navbar': (context) => Navbar(),
          '/splash': (context) => Splash(),
        },
      ),
    );
  }
}
