import 'package:flutter/material.dart';

// Çalışma Mantığı
// Kullanacağımız renk kodunu ismiyle birlikte buraya ekliyoruz.
// Daha sonra buradaki rengi kullanacağımız widget içine önce bu file import ediyoruz.
// Import ettikten sonra rengi kullanacağımız satıra gelip 'ColorConstants.white' örneği gibi istediğimiz rengi ekliyoruz. Detaylar Readme.md
class ColorConstants {
  ColorConstants._init();
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFffffff);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color amaranth = Color(0xFFE91E63);
  static const Color pomegranate = Color(0xFFE91E63);
  static const Color dodgerBlue = Color(0xFF2196F3);
  static const Color fruitSalad = Color(0xFF4CAF50);
  static const Color blueGray = Color(0xFF607D8B);
  static const Color steelGray = Color(0xFF201E2A);
  static const Color transparent = Colors.transparent;
  static const Color mercury = Color(0xffE8E8E8);
  static const Color casablanca = Color(0xFFF8B23E);
  static const Color errorColor = Color(0xffFBC670); //Color(0xffbb2d3b);
  static const Color secondaryColor = Colors.white;
  static const Color primaryColor = Color(0xffFBC670);
  static const Color scarpaFlow = Color(0xFF56565C);
}
