import 'package:eztajwid/views/Quran.dart';
import 'package:eztajwid/views/compas.dart';
import 'package:eztajwid/views/home.dart';
import 'package:eztajwid/views/materi.dart';
import 'package:eztajwid/views/tasbih.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}
int _currentState = 0;
class _NavbarState extends State<Navbar> {
  void gantiPage (int state) {
    setState(() {
      
    });}

    final pages =[
      Home(),
      Materi(),
      quran(),
      compas(),
    ];

final iconList = <IconData>[
  FontAwesomeIcons.house,
  FontAwesomeIcons.book,
  FontAwesomeIcons.bookQuran,
  FontAwesomeIcons.kaaba,
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      pages[_currentState],
      
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 181, 186, 223),
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        height: 80,
        iconSize: 18,
        // borderColor: Colors.amber,
        icons: iconList,
        activeIndex: _currentState,
        gapLocation: GapLocation.center,
        activeColor: Colors.white, 
        onTap: (index) => setState(() => _currentState = index),
      ),
       floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Tasbih()));
    },
    child: FaIcon(FontAwesomeIcons.spinner), // Ganti ikon sesuai dengan tindakan yang diinginkan
    backgroundColor: Color.fromARGB(255, 8, 54, 92), // Ganti warna sesuai dengan preferensi Anda
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
    );
  }
}