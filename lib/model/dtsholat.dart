import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class sholat {
  String text1;
  String text2;
  Color warna;
  String url;

  sholat(
    this.text1,
    this.text2,
    this.warna,
    this.url,
  );
}

List<sholat> slt = [
  sholat("Imsak", "03.40", Colors.black, "assets/icons/Shalat-Shubuh.svg"),
  sholat("Fajr", "05.01", Colors.amber, "assets/icons/Shalat-Dhuha.svg"),
  sholat("Dhuhur", "11.18", Colors.orange, "assets/icons/Shalat-Zhuhur.svg"),
  sholat(
      "Asr", "14.21", Colors.orange.shade700, "assets/icons/Shalat-Ashar.svg"),
  sholat("Magrhib", "17.29", Colors.purple, "assets/icons/Shalat-Maghrib.svg"),
  sholat("Isha'a", "18.36", Colors.purple.shade600,
      "assets/icons/Shalat-Isya.svg"),
];

String tgl() {
  
  final now = DateTime.now();
  final formatter = DateFormat('EEEE, d MMMM y','id');
  return formatter.format(now);
}
