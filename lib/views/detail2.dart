import 'package:eztajwid/api/ayatapi.dart';
import 'package:eztajwid/model/dtquran.dart';
import 'package:flutter/material.dart';

class SurahDetailPage2 extends StatelessWidget {
  final Surah surah;

  SurahDetailPage2({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${surah.name}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView.builder(
            // itemCount: surah.ayatCount ?? 0,
            itemBuilder: (context, index) {
              return FutureBuilder<Ayat>(
                future: getAyatByIndex(surah.number, index + 1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Ayat ayat = snapshot.data!;
                    return ListTile(
                      title: Text(
                        ayat.textIndopak,
                        textAlign: TextAlign.right,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return CircularProgressIndicator(); // Menampilkan indikator loading
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
