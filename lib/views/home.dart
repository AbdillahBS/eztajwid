import 'dart:ui';
import 'package:eztajwid/model/dtsholat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/logoezl.png")),
                const Text(
                  "EzLearning Tajwid",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 78, 203),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            // Container(
            //   padding: EdgeInsets.all(5),
            //   margin: EdgeInsets.symmetric(horizontal: 15),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     color: Colors.white,
            //   ),
            //   child: TextField(
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontFamily: 'open sans',
            //     ),
            //     decoration: InputDecoration(
            //         hintText: "cari materi yang di inginkan",
            //         fillColor: Colors.transparent,
            //         icon: Icon(Icons.search),
            //         enabledBorder: UnderlineInputBorder(
            //           borderSide: BorderSide.none,
            //         ),
            //         focusedBorder: UnderlineInputBorder(
            //           borderSide: BorderSide.none,
            //         )),
            //   ),
            // ),

            // const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/masjid1.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                      title: Text(
                        tgl(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "1 Rabiul Akhir 1145 H",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        "31º",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        Text(
                          waktu(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        Text(
                          "Fajr » Kabupaten Banyuwangi",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: slt.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final sholat prayer = slt[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            prayer.text1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prayer.text2,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      Color.fromARGB(255, 169, 215, 253),
                                  child: SvgPicture.asset(
                                    prayer.url,
                                    color: prayer.warna,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            //kotak materi
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quotes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 78, 203),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const Materi()));
                      //   },
                      //   child: const Text(
                      //     "lihat semua",
                      //     style: TextStyle(
                      //       color: Color.fromARGB(255, 0, 78, 203),
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final materi in materiList)
                          Container(
                              margin: const EdgeInsets.only(right: 20),
                              padding: const EdgeInsets.all(20),
                              width: 300,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.6),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   materi['text1'],
                                  //   height: 180/2,
                                  //   width: 160/2,
                                  // ),
                                  Text(
                                    materi['text1'],
                                    style: GoogleFonts.lateef(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),

                                  const SizedBox(height: 10),
                                  Text(
                                    " \" " + materi['text2'] + " \" ",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    maxLines: 4,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> materiList = [
  {
    'text1': 'ﻣَﻦْ ﺟَﺪَّ ﻭَﺟَﺪَ',
    'text2': 'Barang siapa bersungguh-sungguh, maka ia akan dapat.',
  },
  {
    'text1': ' ﺍﻟﻮَﻗْﺖُ ﺃَﺛْﻤَﻦُ ﻣِﻦَ ﺍﻟﺬَّﻫَﺐِ',
    'text2': 'Waktu itu lebih mahal daripada emas',
  },
  {
    'text1': 'ﺧَﻴْﺮُ ﺟَﻠِﻴْﺲٍ ﻓﻲِ ﺍﻟﺰَّﻣَﺎﻥِ ﻛِﺘَﺎﺏٌ',
    'text2': 'Sebaik-baik teman duduk di setiap waktu adalah buku.',
  },
  {
    'text1': 'ﻟَﻮْﻻَ ﺍﻟﻌِﻠْﻢُ ﻟَﻜَﺎﻥَ ﺍﻟﻨَّﺎﺱُ ﻛَﺎﻟﺒَﻬَﺎﺋِﻢِ',
    'text2':
        'Seandainya tidak ada ilmu agama, niscaya manusia itu seperti binatang.',
  },
  {
    'text1': 'ﺍﻟﻌِﻠْﻢُ ﺑِﻼَ ﻋَﻤَﻞٍ ﻛَﺎﻟﺸَّﺠَﺮِ ﺑِﻼَ ﺛَﻤَﺮ',
    'text2': ' Ilmu yang tidak diamalkan seperti pohon tidak berbuah.',
  },
  {
    'text1': 'ﺍﻟﺸَّﺮَﻑُ ﺑِﺎﻷَﺩَﺏِ ﻻَ ﺑِﺎﻟﻨَّﺴَﺐِ',
    'text2':
        ' Kemuliaan itu diperoleh dengan adab kesopanan, bukan dengan keturunan.',
  },
  {
    'text1': 'ﺃَﺻْﻠِﺢْ ﻧَﻔْﺴَﻚَ ﻳَﺼْﻠُﺢْ ﻟَﻚَ ﺍﻟﻨَّﺎﺱُ',
    'text2':
        'Perbaikilah dirimu sendiri, niscaya orang-orang lain akan baik kepadamu.',
  },
  {
    'text1': 'ﻓَﻜِّﺮْ ﻗَﺒْﻞَ ﺃَﻥْ ﺗَﻌْﺰِﻡَ',
    'text2': 'Berpikirlah dahulu sebelum kamu berkemauan (merencanakan).',
  },
  {
    'text1': '',
    'text2': '',
  },
];
