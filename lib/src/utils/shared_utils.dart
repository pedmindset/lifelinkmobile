import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String prefUserName = "pref_user_name";
const String prefUserAvatar = "pref_user_avatar";

const String prefDarkMode = "pref_dark_mode";
const String prefAuthKey = "pref_auth_key";
const String prefLoggedIn = "pref_logged_in";

class SharedPrefs {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> getPrefs() async {
    Completer<SharedPreferences> completer = Completer();
    if (_prefs != null) {
      completer.complete(_prefs);
    } else {
      _prefs = await SharedPreferences.getInstance();
      completer.complete(_prefs);
    }
    return completer.future;
  }

  static Future<bool> deleteUserData() {
    return getPrefs().then((prefs) {
      return prefs.clear();
    });
  }

  static Future<bool> saveDarkMode(bool darkMode) {
    return getPrefs().then((prefs) {
      return prefs.setBool(prefDarkMode, darkMode);
    });
  }

  static Future<bool> getDarkMode() {
    return getPrefs().then((prefs) {
      return Future.value(prefs.getBool(prefDarkMode) ?? false);
    });
  }

  static Future<bool> saveLoggedIn(bool login) {
    return getPrefs().then((prefs) {
      return prefs.setBool(prefLoggedIn, login);
    });
  }

  static Future<bool> getLoggedIn() {
    return getPrefs().then((prefs) {
      return Future.value(prefs.getBool(prefLoggedIn) ?? false);
    });
  }

  static getProfile() {
    return getPrefs().then((prefs) {
      return Future.value(prefs.getString(prefUserAvatar) ?? "");
    });
  }
}

class PreferenceUtils {
  static SharedPreferences? _prefsInstance;
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String? getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue;
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static int? getInt(String key, [int? defValue]) {
    return _prefsInstance!.getInt(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }
}
