import 'package:flutter/material.dart';

const Color facebookColor = Color(0xff39579A);
// 1C5C87
const Color whatsappColor = Color(0xff075E54);
const Color linkedinColor = Color(0xff0085E0);
const Color googleColor = Color(0xffDF4A32);

const Color primaryColor = Color(0xff169E79);
// MaterialColor primeColor = MaterialColor(0xff169E79, []);
const Color secondaryColor = Color(0xffE4ECE6);

final darkTheme = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.black,
  platform: TargetPlatform.iOS,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.white,
  platform: TargetPlatform.iOS,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  dividerColor: Colors.white54,
);
