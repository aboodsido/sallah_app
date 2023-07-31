import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/profile_data.dart';
import '../../Views/Screens/navigator_screen.dart';
import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';
import '../../secured_storage.dart';

class LoginController {
  static SecureStorage storage = SecureStorage();
  static Future login(String email, password, context) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['status'] == true) {
          //*Get token from register
          String token = data['user']['access_token'];
          await storage.writeSecureToken('access_token', token);

          //* store the user data loacally
          final name = data['user']['name'];
          final email = data['user']['email'];
          final phoneNumber = int.tryParse(data['user']['mobile']) ?? 0;
          final prifileData =
              ProfileData(name: name, email: email, phoneNumber: phoneNumber);
          final prefs = await SharedPreferences.getInstance();
          final profileJson = jsonEncode(prifileData.toJson());
          prefs.setString('profileData', profileJson);
          CustomDialog.showSnackBar(
              context, 'Login Done Successfully !', Colors.green);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CustomBottomNavigationBar(),
            ),
          );
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
