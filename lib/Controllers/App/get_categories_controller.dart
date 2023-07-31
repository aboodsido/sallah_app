import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Models/category_model/category_model.dart';
import '../../Models/product_model/product_model.dart';
import '../../constants/api_consts.dart';

class GetCategories {
  static Future<CategoryModel> getCategories() async {
    final http.Response response =
        await http.get(Uri.parse('${BASE_URL}getCategories'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return CategoryModel.fromJson(json);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  static Future getProductByCategoryId(int categoryId) async {
    String url = '${BASE_URL}getProductsByCategoryId/$categoryId';

    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return ProductModel.fromJson(json);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
