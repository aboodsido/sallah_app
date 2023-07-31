import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/profile_data.dart';
import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';

class RegisterController {
  static Future register(
      String email, password, phoneNumber, name, context) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}signUp'),
        body: {
          'email': email,
          'password': password,
          'name': name,
          'mobile': phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['status'] == true) {
          //* store the user data loacally
          final name = data['user']['name'];
          final email = data['user']['email'];
          final phoneNumber = int.tryParse(data['user']['mobile']) ?? 0;
          final prifileData =
              ProfileData(name: name, email: email, phoneNumber: phoneNumber);
          final prefs = await SharedPreferences.getInstance();
          final profileJson = jsonEncode(prifileData.toJson());
          prefs.setString('profileData', profileJson);

          print('Register Done Successfully !');
          Navigator.pushReplacementNamed(context, '/WelcomeScreen');
        } else {
          CustomDialog.showSnackBar(context, data['message'], Colors.red);
        }
      } else {
        CustomDialog.showSnackBar(context, 'There is some error', Colors.red);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
