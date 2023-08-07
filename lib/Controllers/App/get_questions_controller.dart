import 'dart:convert';

import '../../Models/fqa/fqa.dart';
import 'package:http/http.dart' as http;

import '../../constants/api_consts.dart';

class AllQuestionsController {
  static Future<Fqa> getQuestions() async {
    final http.Response response =
        await http.get(Uri.parse('${BASE_URL}allQuestions'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Fqa.fromJson(json);
    } else {
      throw Exception('Failed to load Questions');
    }
  }
}
