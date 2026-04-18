import 'dart:convert';

import 'package:bookia/core/cache/shred_pref/shared_pref_keys.dart';
import 'package:bookia/core/helper/app_logger.dart';
import 'package:bookia/features/auth/data/models/auth_response_model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._(); // Private constructor to prevent instantiation

  static late SharedPreferences _sharedPreferences;

  //! Here The Initialize of cache (call it in main)
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //! ===============================
  //! General Methods
  //! ===============================

  //* this method to put string data in local database using key
  static Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return await _sharedPreferences.setString(key, value);
  }

  //* this method to get string data from local database using key
  static String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  //* this method to put dynamic data in local database using key
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
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

  //* this method to get dynamic data by key already saved in local database
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  //* remove data using specific key
  static Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  //* this method to check if local database contains {key}
  static Future<bool> containsKey({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

  //* this method to clear local database
  static Future<bool> clearData() async {
    return _sharedPreferences.clear();
  }

  //! ===============================
  //! Helper Methods
  //! ===============================

  //* this method to save user data
  static Future<void> saveUserData(User? user) async {
    //check if user is null or empty
    if (user == null) {
      AppLogger.error('User is null', tag: 'SharedPrefService');
      return;
    }
    //convert user object to json
    final jsonUser = user.toJson();
    //convert json to string
    final String stringUser = jsonEncode(jsonUser);
    //save string in local database
    await setString(key: SharedPrefKeys.user, value: stringUser);
  }

  //* this method to get user data
  static User? getUserData() {
    //get string from local database
    final String? stringUser = getString(key: SharedPrefKeys.user);
    //check if string is null or empty
    if (stringUser == null || stringUser.isEmpty) {
      AppLogger.error('User is null or empty', tag: 'SharedPrefService');
      return null;
    }
    //convert string to json
    final jsonUser = jsonDecode(stringUser);
    //convert json to user object
    return User.fromJson(jsonUser);
  }

  //* this method to delete user data
  static Future<void> deleteUserData() async {
    await removeData(key: SharedPrefKeys.user);
  }
}
