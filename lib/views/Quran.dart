import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class quran extends StatelessWidget {
  const quran({Key? key});

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
                              "Surah Al-Fatiha",
                              style: TextStyle(
                                fontSize: 24,
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
                Container(
                  child: Image.asset("assets/images/quran.png"),
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
                            "$surahNumber. ${surah['name']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            surah['nameArabic'],
                            style: GoogleFonts.lateef(
                                fontSize: 25,
                                // fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          onTap: () {
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

final List<Map<String, dynamic>> surahList = [
  {"name": "Al-Fatiha", "nameArabic": "الفاتحة"},
  {"name": "Al-Baqarah", "nameArabic": "البقرة"},
  {"name": "Al-Imran", "nameArabic": "آل عمران"},
  {"name": "An-Nisa", "nameArabic": "النساء"},
  {"name": "Al-Ma'idah", "nameArabic": "المائدة"},
  {"name": "Al-An'am", "nameArabic": "الأنعام"},
  {"name": "Al-A'raf", "nameArabic": "الأعراف"},
  // Tambahkan surah lainnya di sini
];
