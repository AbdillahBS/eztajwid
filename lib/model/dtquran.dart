class Surah {
  int number;
  String name;
  String englishName;
  String indo;

  Surah({required this.number, required this.name, required this.englishName, required this.indo});

  factory Surah.fromJson(Map<String, dynamic> json) {
    final translatedName = json['translated_name'];
    final translatedNameValue = translatedName != null ? translatedName['name'] : '';
    
    return Surah(
      indo: translatedNameValue,
      number: json['id'], // Ubah sesuai atribut yang sesuai di JSON
      name: json['name_arabic'],
      englishName: json['name_simple'],
    );
  }
}
