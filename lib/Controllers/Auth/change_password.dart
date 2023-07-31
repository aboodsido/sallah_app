import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sallah_app/secured_storage.dart';

import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';

final storage = SecureStorage();

class ChangePasswordController {
  static Future changePassword(
      String oldPassword, password, confirmPassword, context) async {
    final token = await storage.readSecureToken('access_token');
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}changePassword'),
        body: {
          'old_password': oldPassword,
          'password': password,
          'confirm_password': confirmPassword,
        },
        headers: {
          'Authorization': 'Bearer $token',
          'Connection': 'keep-alive',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['status'] == true) {
          CustomDialog.showSnackBar(
              context, 'Password Changed Successfully !', Colors.green);
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
