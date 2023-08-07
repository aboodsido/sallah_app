import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Models/offers_model/offers_model.dart';
import '../../constants/api_consts.dart';

class OffersController {
  static Future<OffersModel> getOffers() async {
    final http.Response response =
        await http.get(Uri.parse('${BASE_URL}getOffers'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return OffersModel.fromJson(json);
    } else {
      throw Exception('Failed to load Offers');
    }
  }
}
