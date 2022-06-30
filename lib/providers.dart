import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth extends ChangeNotifier {
  late String _userId;
  late String _token;
  late DateTime _expiryDate;

  Future<void> signup(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCQUWjKLAlHi2XkDdG4BES5XKrAn8mhd-I";

    final response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(json.decode(response.body));
  }

  Future<void> login(String email, String password) async {
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCQUWjKLAlHi2XkDdG4BES5XKrAn8mhd-I";

    final response = await http.post(Uri.parse(url),
        body: json.encode(
            {'email': email, "password": password, "returnSecureToken": true}));
    print(json.decode(response.body));
  }
}
