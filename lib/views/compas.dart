import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class compas extends StatefulWidget {
  const compas({Key? key});

  @override
  State<compas> createState() => _compasState();
}

class _compasState extends State<compas> {
  int _selectedCompassType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     "Compas",
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 28,
        //     ),
        //   ),
        // ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/main_screen.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Compas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 20),
              CupertinoSegmentedControl(
                children: {
                  0: Text("Compass 1"),
                  1: Text("Compass 2"),
                },
                groupValue: _selectedCompassType,
                onValueChanged: (value) {
                  setState(() {
                    _selectedCompassType = value;
                  });
                },
              ),
              Expanded(
                child: Center(
                  child: SmoothCompass(
                    height: 250,
                    width: 280,
                    isQiblahCompass: true,
                    compassBuilder: (context, snapshot, child) {
                      return SizedBox(
                        height: 280,
                        width: 280,
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 800),
                          turns: snapshot?.data?.turns ?? 0,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: 
                                
                                SvgPicture.asset(
                                  _selectedCompassType == 0
                                      ? 'assets/images/compass.svg'
                                      : 'assets/images/compass3.svg',
                                  fit: BoxFit.cover,
                                  
                                ),
                              ),
                              Positioned(
                                top: _selectedCompassType == 0 ? 0 : 9,
                                left: _selectedCompassType == 0 ? 6 : 27,
                                right: 0,
                                bottom: _selectedCompassType == 0 ? 5 : 0,
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 500),
                                  turns:
                                      (snapshot?.data?.qiblahOffset ?? 0) / 360,
                                  //Place your qiblah needle here
                                  child: SvgPicture.asset(
                                    _selectedCompassType == 0 ?
                                    'assets/images/needle.svg'
                                    : 'assets/images/needle1.svg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
