import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    //final url = 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=[API_KEY]'; //signupNewUser | verifyPassword
    //final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=[API_KEY]'; //signUp | signInWithPassword
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCeROXnIO2X9CAr13vP-WIsbm6XADnNXk0'); //signUp | signInWithPassword
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
