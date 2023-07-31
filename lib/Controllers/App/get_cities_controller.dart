import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sallah_app/constants/api_consts.dart';

import '../../Models/city_model/city_model.dart';

class GetCitiesController {
  static Future<List<String?>> fetchCityNames() async {
    final http.Response response =
        await http.get(Uri.parse('${BASE_URL}getCities'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final CityModel cityModel = CityModel.fromJson(json);
      return cityModel.cities?.map((city) => city.name).toList() ?? [];
    } else {
      throw Exception('Failed to load cities');
    }
  }
}
