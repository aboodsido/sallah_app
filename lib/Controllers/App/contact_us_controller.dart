import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Views/Screens/DrawerScreens/InnerScreens/contact_done_screen.dart';
import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';

class ContactUsController {
  static Future sendFormData(
    context, {
    required String email,
    required mobile,
    required name,
    required message,
    required type,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}contactUs'),
        body: {
          'email': email,
          'mobile': mobile,
          'name': name,
          'message': message,
          'type': type,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['status'] == true) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const ContactDoneScreen()));
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
