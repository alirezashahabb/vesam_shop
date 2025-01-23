import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManger {
  SharedPreferences? _preferences;

  SharedPreferenceManger._privateConstructor();

  static final SharedPreferenceManger _instance =
      SharedPreferenceManger._privateConstructor();

  factory SharedPreferenceManger() {
    return _instance;
  }

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // this method remove key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }
}
