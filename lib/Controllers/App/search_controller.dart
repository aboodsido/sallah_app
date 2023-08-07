import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Views/Widgets/custom_dialog.dart';
import '../../constants/api_consts.dart';

class SearchProductController {
  static Future search(String textSearch, context) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${BASE_URL}search'),
        body: {'text': textSearch},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        if (json['status'] == true) {
        } else {
          CustomDialog.showSnackBar(context, json['message'], Colors.red);
        }
      } else {
        CustomDialog.showSnackBar(context, 'There is some error', Colors.red);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
