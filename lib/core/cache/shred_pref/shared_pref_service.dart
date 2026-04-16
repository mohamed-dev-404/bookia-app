import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._(); // Private constructor to prevent instantiation

  static late SharedPreferences _sharedPreferences;
  //! Here The Initialize of cache (call it in main)
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //* this method to put string data in local database using key
  String? getDataString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  //* this method to put dynamic data in local database using key

  Future<bool> storeData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else {
      return await _sharedPreferences.setDouble(key, value);
    }
  }

  //* this method to get data by key already saved in local database

  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  //* remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  //* this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

  //* this method to clear local database
  Future<bool> clearData({required String key}) async {
    return _sharedPreferences.clear();
  }

  //* this fun to put data in local data base using key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else {
      return await _sharedPreferences.setInt(key, value);
    }
  }
}
