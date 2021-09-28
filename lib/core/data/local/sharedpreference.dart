import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
// obtain shared preferences

  Future<bool> set(String key, Object value) async {
    final _prefs = await SharedPreferences.getInstance();

    if (value is String) {
      // set value
      return _prefs.setString(key, value);
    } else if (value is int) {
// set value
      return _prefs.setInt(key, value);
    } else if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else
      throw new Exception("Unsupported data type found");
  }

  Future<bool> delete(String key) async {
    /* remove data */
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }

  Future<bool> reset() async {
    /* remove data */
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }

  Future<int> getInt(String key, int def) async {
    /* get int value */
    final _prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    final int value = _prefs.getInt(key) ?? def;
    return value;
  }

  Future<String> getString(String key, String def) async {
    /* get int value */
    final _prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    final String value = _prefs.getString(key) ?? def;
    return value;
  }

  Future<bool> getBool(String key, bool def) async {
    /* get int value */
    final _prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    final bool value = _prefs.getBool(key) ?? def;
    return value;
  }

  Future<double> getDouble(String key, double def) async {
    /* get int value */
    final _prefs = await SharedPreferences.getInstance();
    // Try reading data from the counter key. If it doesn't exist, return 0.
    final double value = _prefs.getDouble(key) ?? def;
    return value;
  }

  Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
