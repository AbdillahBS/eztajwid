import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tasbih extends StatefulWidget {
  @override
  _TasbihState createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int jumlahTasbih = 0;
  double putaran = 2 * 3.14;
  // int _currentZker = 0;

  void tambahTasbih() {
    setState(() {
      if (putaran == 0) {
        putaran = 2 * 3.14;
        (jumlahTasbih == 2) ? jumlahTasbih = 0 : jumlahTasbih++;
      }
      if (jumlahTasbih < 34) {
        putaran -= (360 / 33) * (3.16 / 180);
        jumlahTasbih++;
      }
      if (jumlahTasbih == 34) {
        resetTasbih();
      }
    });
  }

  void resetTasbih() {
    setState(() {
      jumlahTasbih = 0;
      putaran = 2 * 3.14; 
      // _currentZker = 0; 
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text('Tasbih'),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(20),
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 28,
              child: IconButton(
                  onPressed: resetTasbih,
                  icon: const FaIcon(FontAwesomeIcons.rotate)),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Container(
            //   margin: const EdgeInsets.only(left: 70),
            //   child: Image.asset(
            //     'assets/images/sebha_head_header.png',
            //     width: mediaQuery.width / 5.64,
            //     height: mediaQuery.height / 8.285,
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 72),
              child: Stack(
                alignment: Alignment.center,
                children: [
                 
                  Transform.rotate(
                    angle: putaran,
                    child: Image.asset(
                      'assets/images/sebha_body_header.png',
                      width: mediaQuery.width / 1.776,
                      height: mediaQuery.height / 3.718,
                      // color: Colors.green,W
                    ),
                  ),
                  Text(
                    '$jumlahTasbih',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
      
            const Text(
              'Jumlah Tasbih:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$jumlahTasbih / 33',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: jumlahTasbih >= 34 ? null : tambahTasbih,
              child: const Text('Tambah Tasbih'),
            ),
          ],
        ),
      ),
    );
  }
}
