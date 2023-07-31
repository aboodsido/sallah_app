import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sallah_app/Views/Screens/Home/profile_screen.dart';
import 'package:sallah_app/secured_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/profile_data.dart';
import '../../Views/Screens/navigator_screen.dart';
import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';

final storage = SecureStorage();

class EditProfileController {
  static Future editProfile(String name, email, phoneNumber, context) async {
    final token = await storage.readSecureToken('access_token');
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}editProfile'),
        body: {
          'email': email,
          'name': name,
          'mobile': phoneNumber,
        },
        headers: {
          'Authorization': 'Bearer $token',
          'Connection': 'keep-alive',
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

          CustomDialog.showSnackBar(
              context, 'Edit Done Successfully !', Colors.green);
        } else {
          CustomDialog.showSnackBar(context, data['message'], Colors.red);
        }
      } else {
        CustomDialog.showSnackBar(context, 'There is Some Error', Colors.red);
      }
    } catch (e) {
      CustomDialog.showSnackBar(context, '$e', Colors.red);
    }
  }
}
