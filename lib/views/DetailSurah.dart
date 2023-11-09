import 'package:eztajwid/model/dtquran.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
class SurahDetailPage extends StatelessWidget {
  final Surah surah;
   final Surah? lastClickedSurah;

  SurahDetailPage({required this.surah, this.lastClickedSurah});

  @override
  Widget build(BuildContext context) {
     int surahNumber = surah.number;
    return Scaffold(
      appBar: AppBar(
        title: Text('${surah.name}'),
      ),
      body: Container(
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
        child: ListView.builder(
          itemCount: quran.getVerseCount(surahNumber),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                quran.getVerse(surahNumber, index + 1, verseEndSymbol: true),
                textAlign: TextAlign.right,
                style: GoogleFonts.lateef(fontSize: 28)
              ),
            );
          },
        ),
      ),
      );
}}