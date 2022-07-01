import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/helper/httpexception.dart';

class Auth with ChangeNotifier {
  late String _userId;
  late String _token;
  DateTime? _expiryDate;

  bool get isAuth {
    return token != null;
  } //user is authenticated if token is not null

  String? get token {
    if (_expiryDate == null) {
      return null;
    }
    if (_expiryDate!.isAfter(DateTime.now()) &&
        _expiryDate != null &&
        _token != null) {
      return _token;
    }
    return null; //returns null if token is expired or null
  }

  Future<void> signup(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCQUWjKLAlHi2XkDdG4BES5XKrAn8mhd-I";
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            "email": email,
            "password": password,
            "returnSecureToken": true,
          }));
      print(json.decode(response.body));
      final responseData = json.decode(response.body);
      if (responseData["error"] != null) {
        throw httpException(responseData["error"]["message"]);
      }
      _token = responseData["idToken"];
      _userId = responseData["localId"];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData["expiresIn"])));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCQUWjKLAlHi2XkDdG4BES5XKrAn8mhd-I";

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            "password": password,
            "returnSecureToken": true
          }));
      print(json.decode(response.body));
      final responseData = json.decode(response.body);
      if (responseData["error"] != null) {
        //for error with status code 200 but with error message like invalid mail
        throw httpException(responseData["error"]["message"]);
      }
      _token = responseData["idToken"];
      _userId = responseData["localId"];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData["expiresIn"])));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
