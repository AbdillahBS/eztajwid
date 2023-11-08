import 'dart:convert';
import 'package:eztajwid/model/dtquran.dart';
import 'package:http/http.dart' as http;

Future<List<Surah>> getSurahWithAyat() async {
  var surahUrl = 'https://api.quran.com/api/v4/chapters?language=id';
  var surahResponse = await http.get(Uri.parse(surahUrl));

  if (surahResponse.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(surahResponse.body)['chapters'];
    List<Surah> surahList = jsonResponse.map((data) => Surah.fromJson(data)).toList();

    for (var surah in surahList) {
      var ayatUrl = 'https://api.quran.com/api/v4/quran/verses/indopak';
      var ayatResponse = await http.get(Uri.parse(ayatUrl));

      if (ayatResponse.statusCode == 200) {
        List<dynamic> ayatData = json.decode(ayatResponse.body)['verses'];

        // Ambil ayat yang sesuai dengan verse key
        var i = 0;
        var verseKey = '${surah.number}:${i+ 1}';
        var ayat = ayatData.firstWhere((ayat) => ayat['verse_key'] == verseKey, orElse: () => null);

        if (ayat != null) {
          surah.ayat = Ayat.fromJson(ayat);
        }
      }
    }

    return surahList;
  } else {
    throw Exception('Failed to load data');
  }
}