class Surah {
  int number;
  String name;
  String englishName;
  String indo;
  Ayat? ayat;
  

  Surah({required this.number, required this.name, required this.englishName, required this.indo,  this.ayat});

  factory Surah.fromJson(Map<String, dynamic> json) {
    final translatedName = json['translated_name'];
    final translatedNameValue = translatedName != null ? translatedName['name'] : '';
    
    return Surah(
      indo: translatedNameValue,
      number: json['id'], 
      name: json['name_arabic'],
      englishName: json['name_simple'],
    );
  }
}

class Ayat {
  int id;
  String verseKey;
  String textIndopak;

  Ayat({required this.id, required this.verseKey, required this.textIndopak});

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      id: json['id'],
      verseKey: json['verse_key'],
      textIndopak: json['text_indopak'],
    );
  }
}
