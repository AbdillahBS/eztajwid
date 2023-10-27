import 'dart:convert';
import 'package:eztajwid/model/dtquran.dart';
import 'package:http/http.dart' as http;

Future<List<Surah>> getSurah() async {
  var url = 'https://api.quran.com/api/v4/chapters?language=id';
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body)['chapters'];
    print('Response Data: $jsonResponse');
    List<Surah> surahList = jsonResponse.map((data) => Surah.fromJson(data)).toList();
    return surahList;
    
  } else {
    throw Exception('Failed to load data');
  }
}