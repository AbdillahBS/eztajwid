import 'dart:convert';
import 'package:eztajwid/model/dtquran.dart';
import 'package:http/http.dart' as http;

Future<List<Surah>> getSurahList() async {
  var surahUrl = 'https://api.quran.com/api/v4/chapters?language=id';
  var surahResponse = await http.get(Uri.parse(surahUrl));

  if (surahResponse.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(surahResponse.body)['chapters'];
    List<Surah> surahList = jsonResponse.map((data) => Surah.fromJson(data)).toList();
    return surahList;
  } else {
    throw Exception('Failed to load surah data');
  }
}