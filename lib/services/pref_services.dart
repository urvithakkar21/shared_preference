
import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  static SharedPreferences? prefs;

  static Future<void> initPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is int) {
      await prefs?.setInt(key, value);
    } else if (value is bool) {
      await prefs?.setBool(key, value);
    } else if (value is double) {
      await prefs?.setDouble(key, value);
    } else if (value is String) {
      await prefs?.setString(key, value);
    } else if (value is List<String>) {
      await prefs?.setStringList(key, value);
    }
  }

  static String getString(String key) {
    return prefs?.getString(key) ?? "";
  }

  static int getInt(String key) {
    return prefs?.getInt(key) ?? 0;
  }

  static double getDouble(String key) {
    return prefs?.getDouble(key) ?? 0.0;
  }
  static bool getBool(String key){
    return prefs?.getBool(key)?? false;
  }
  static List<String> getStringList(String key){
    return prefs?.getStringList(key)??[];
  }
  static Future<void> removeValue(String key) async {
    await prefs?.remove(key);
  }
  static Future<void> clearPref() async {
    await prefs?.clear();
  }
}
