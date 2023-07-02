import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  //static SharedPreferences? _preferences;
  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getString(String key, {required String defaultValue}) {
    return _preferences.getString(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) {
    return _preferences.setString(key, value);
  }

  // Add more methods for handling other data types as per your requirements
}
