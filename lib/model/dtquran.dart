class Quran {
  final int surahNumber;
  final String surahName;
  final String surahEnglishName;
  final String surahEnglishNameTranslation;
  final String revelationType;
  final List<Ayat> ayahs;

  Quran({
    required this.surahNumber,
    required this.surahName,
    required this.surahEnglishName,
    required this.surahEnglishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });
}

class Ayat {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;

  Ayat({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });
}
