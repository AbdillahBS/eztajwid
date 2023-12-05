import 'package:eztajwid/api/quranapi.dart';
import 'package:eztajwid/model/dtquran.dart';
import 'package:eztajwid/views/DetailSurah.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class quran extends StatefulWidget {
  const quran({Key? key}) : super(key: key);

  @override
  State<quran> createState() => _quranState();
}

class _quranState extends State<quran> {
  List<Surah> surahList = [];
  Surah? lastClickedSurah;

  @override
  void initState() {
    super.initState();
    initSurahList();
  }

  void initSurahList() async {
    try {
      final result = await getSurahList();
      setState(() {
        surahList = result;
      });
    } catch (e) {
      // Tangani kesalahan jika terjadi
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Al-Qur'an",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Card(
            margin: EdgeInsets.all(10),
            color: Color.fromARGB(255, 181, 186, 223),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Terakhir Dibaca",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              lastClickedSurah != null
                                  ? "Surah ${lastClickedSurah!.englishName}"
                                  : "Belum Ada Surah Terakhir",
                              style: TextStyle(
                                fontSize: lastClickedSurah != null ? 24 : 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Image.asset("assets/images/quran.png"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daftar Surah",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: surahList.length,
                  itemBuilder: (context, index) {
                    final surah = surahList[index];
                    final surahNumber = index + 1;
                    return Column(
                      children: [
                        ListTile(
                          title: Text(
                            "$surahNumber. ${surah.englishName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(surah.indo),
                          ),
                          trailing: Text(
                            surah.name,
                            style: GoogleFonts.lateef(
                                fontSize: 25, fontStyle: FontStyle.italic),
                          ),
                          onTap: () {
                            setState(() {
                              lastClickedSurah = surah;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SurahDetailPage(
                                      surah: surah,
                                      lastClickedSurah: lastClickedSurah),
                                ));
                          },
                        ),
                        Divider(thickness: 1)
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
