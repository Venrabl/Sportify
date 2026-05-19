import 'package:flutter/material.dart';

final Color kPrimary = Color(0xFF2E7D32); // deep green
final Color kAccent = Color(0xFF7C4DFF); // subtle purple accent
final Color kBg = Color(0xFFF7F8FC); // soft light background

final ThemeData appTheme = ThemeData(
  primaryColor: kPrimary,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: kAccent),
  scaffoldBackgroundColor: kBg,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 16, color: Colors.black87),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 2,
  ),
);
