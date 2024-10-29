import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // user information
  final String userId = "id";
  final String userImage = "image";
  final String userName = "fname";
  final String userEmail = "email";

  final String theme = "theme";

  final String firstTime = "firstTime";

  final String lang = "lang";

  // Set that the app is launched for the first time
  Future<void> setFirstTime(bool state) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(firstTime, state);
  }

  // Save the theme
  Future<void> saveTheme(bool theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(this.theme, theme);
  }

  // Get the saved theme
  Future<bool?> getTheme() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(theme);
  }

//save user info into shared preferences
  Future<void> saveUser({
    required int id,
    required String image,
    required String name,
    required String email,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(this.userId, id);
    prefs.setString(this.userImage, image);
    prefs.setString(this.userName, name);
    prefs.setString(this.userEmail, email);
  }

  //save user info into shared preferences
  Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(this.userId);
    prefs.remove(this.userImage);
    prefs.remove(this.userName);
    prefs.remove(this.userImage);
  }

  Future<void> saveLanguage(String lang) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(this.lang, lang);
  }

  // Get the saved theme
  Future<String?> getLanguage() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(lang);
  }
}
