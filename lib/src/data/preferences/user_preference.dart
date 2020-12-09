import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static const PREF_ID_TOKEN = "idToken";
  static const PREF_USER_ID = "userId";

  UserPreference();

  Future<String> getIdToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_ID_TOKEN) ?? null;
  }

  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_USER_ID) ?? null;
  }

  void setIdToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_ID_TOKEN, value);
  }

  void setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_USER_ID, value);
  }
}
