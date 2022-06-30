import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/helper/httpexception.dart';

class Auth extends ChangeNotifier {
  late String _userId;
  late String _token;
  late DateTime _expiryDate;

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
    } catch (error) {
      throw error;
    }
  }
}
