import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'shared_utils.dart';

class ConstUtils {
  String month = DateFormat.MMMM().format(
    DateTime.now(),
  );

  static String getYear(DateTime dateTime) {
    DateFormat formatter = DateFormat('yyyy');
    return formatter.format(dateTime);
  }

  static String getCurrentDate(String dateTime) {
    DateFormat formatter = DateFormat('EEE, MMM d, yyyy');
    DateTime todayDate = DateTime.parse(dateTime);
    return formatter.format(todayDate);
  }

  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(
        color: Color(0xFFDBDBDB),
        offset: Offset(0, 3),
        blurRadius: 10,
        spreadRadius: 2),
  ];

  static List<BoxShadow> shadowDark = <BoxShadow>[
    const BoxShadow(
        color: Color(0xFF474747),
        offset: Offset(0, 3),
        blurRadius: 10,
        spreadRadius: 2),
  ];

  static List<BoxShadow> cardShadow = <BoxShadow>[
    const BoxShadow(
        color: Color(0xFF646464),
        offset: Offset(0, -4),
        blurRadius: 5,
        spreadRadius: 2),
  ];

  static checkPermissions() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.microphone,
      //add more permission to request here.
    ].request();

    if (statuses[Permission.camera]!.isDenied) {
      //check each permission status after.
      log("Camera permission is denied.");
    }

    if (statuses[Permission.storage]!.isDenied) {
      //check each permission status after.
      log("Storage permission is denied.");
    }
    if (statuses[Permission.microphone]!.isDenied) {
      //check each permission status after.
      log("microphone permission is denied.");
    }
  }

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static const double kPadding = 20;
  static const double avatarRadius = 45;

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool getDarkTheme() {
    var darkModeOn = PreferenceUtils.getBool(prefDarkMode);
    return darkModeOn;
  }
}
