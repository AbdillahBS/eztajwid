import 'dart:convert';
import 'package:eztajwid/model/dtquran.dart';
import 'package:http/http.dart' as http;

Future<List<Ayat>> getAyatList(int surahNumber) async {
  var ayatUrl = 'https://api.quran.com/api/v4/quran/verses/indopak';
  var ayatResponse = await http.get(Uri.parse(ayatUrl));

  if (ayatResponse.statusCode == 200) {
    List<dynamic> ayatData = json.decode(ayatResponse.body)['verses'];

    return ayatData
        .where((ayat) => ayat['verse_key'].startsWith('$surahNumber:'))
        .map((ayat) => Ayat.fromJson(ayat))
        .toList();
  } else {
    throw Exception('Failed to load ayat data');
  }
}

Future<Ayat> getAyat(int surahNumber, int ayatIndex) async {
  var ayatList = await getAyatList(surahNumber);
  var verseKey = '$surahNumber:$ayatIndex';

  return ayatList.firstWhere(
    (ayat) => ayat.verseKey == verseKey,
    orElse: () => Ayat(id: 0, verseKey: '', textIndopak: 'Ayat not found'),
  );
}
