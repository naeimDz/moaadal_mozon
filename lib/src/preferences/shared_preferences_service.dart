import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getString(String key, {String defaultValue = ""}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  static double getDouble(String key, {double defaultValue = 0}) {
    return _preferences.getDouble(key) ?? defaultValue;
  }

  static Future<bool> setDouble(String key, double value) {
    return _preferences.setDouble(key, value);
  }

  static Future<bool> setBool(bool value, {String key = 'seen_onboarding'}) {
    return _preferences.setBool(key, value);
  }

  static bool getBool(
      {bool defaultValue = false, String key = 'seen_onboarding'}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  static List<double> getListDouble(List keys) {
    List<double> a = [];
    for (String key in keys) {
      a.add(_preferences.getDouble(key) ?? 00);
    }
    return a;
  }
  // note:Add more methods for handling other data types as per requirements
}
