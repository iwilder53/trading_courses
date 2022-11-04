import 'package:flutter/material.dart';
import 'package:trading_courses/helpers/http_helper.dart';
import '../../../api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  User user = User(
      email: 'email',
      fullName: 'fullName',
      dob: null,
      gender: 'gender',
      phone: null,
      token: 'token');

  login(num phone) async {
    final url = '${webApi['domain']}${endPoint['login']}';
    final body = {
      'mobileNumber': phone,
    };
    try {
      //  print(body);
      final response = await RemoteServices.httpRequest(
          method: 'POST',
          body: body,
          url:
              url); // await http.post(Uri.parse(url), body: body, headers: {"Content-Type": "application/json"});

      final responseData = response; // json.decode(response.body);
      print(responseData);

      if (response['message'] == 'User Already exists') {
        print('works');
        user = User(
          fullName: responseData['result']['fullName'],
          phone: responseData['result']['mobileNumber'],
          email: responseData['result']['email'] ?? '',
          dob: responseData['result']['dob'] == null
              ? null
              : DateTime.parse(responseData['result']['dob']).toLocal(),
          gender: responseData['result']['gender'] ?? '',
          token: responseData['accessToken'],
        );
        notifyListeners();
      }

      return responseData;
    } catch (error) {
      return {"success": false, "message": "login failed"};
    }
  }

  register(userData) async {
    final url = '${webApi['domain']}${endPoint['register']}';
    var body = json.encode(userData);
    try {
      final response = await http.post(Uri.parse(url),
          body: body, headers: {"Content-Type": "application/json"});

      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['success']) {
        user = User(
          fullName: responseData['result']['fullName'],
          phone: responseData['result']['mobileNumber'],
          email: responseData['result']['email'] ?? '',
          dob: responseData['result']['dob'] == null
              ? null
              : DateTime.parse(responseData['result']['dob']).toLocal(),
          gender: responseData['result']['gender'] ?? '',
          token: responseData['accessToken'],
        );
      }

      notifyListeners();

      return responseData;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
