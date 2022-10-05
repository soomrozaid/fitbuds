import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbuds/auth/auth.dart';
import 'package:uuid/uuid.dart';

class AuthenticationRepository {
  // List<User> _getUsers() async {
  //   SharedPreferences _prefs = await SharedPreferences.getInstance();
  //   Object? users = _prefs.get('users');
  // }

  Future<void>? clearUsers() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  Future<bool> signin({
    required String username,
    required String password,
  }) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    List<String>? _users = _pref.getStringList('users');
    bool? _user = _users?.contains(username);
    print(_user);
    return false;
  }

  Future<bool> signup({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<String>? _users = _prefs.getStringList('users');
    Map<String, dynamic> _user = {
      'id': const Uuid().v4(),
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    };
    print(_user);
    try {
      _prefs.setStringList('users', [...?_users, _user.toString()]);
      return true;
    } catch (e) {
      return false;
    }
  }
}
