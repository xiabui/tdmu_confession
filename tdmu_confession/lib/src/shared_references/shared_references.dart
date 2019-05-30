import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  static Future<bool> saveUserID(String uid) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("uid", uid);
    return preferences.commit();
  }

  static Future<bool> loginSuccessfully() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("success", true);
    return preferences.commit();
  }

  static Future<bool> saveUserName(String name) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("name", name);
    return preferences.commit();
  }
  
  static Future<String> getUserID() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String userID = preferences.getString("uid");
    return userID;
  }

  static Future<String> getUserName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String userName = preferences.getString("name");
    return userName;
  }

  static Future<bool> getLoginSuccess() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    bool success = preferences.getBool("success");
    print(success);
    return success;
  }
}