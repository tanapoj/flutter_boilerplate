import 'package:boilerplate2/src/ui/_theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStatePreference {
  static const PREF_MAIN_THEME = "mainTheme";

  AppStatePreference();

  Future<ThemeType> getMainTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_MAIN_THEME) == ThemeType.Dark.toString() ? ThemeType.Dark : ThemeType.Light;
  }

  void setMainTheme(ThemeType value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_MAIN_THEME, value.toString());
  }
}
