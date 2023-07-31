import 'category.dart';

class CategoryModel {
  bool? status;
  int? code;
  String? message;
  List<Category>? categories;

  CategoryModel({this.status, this.code, this.message, this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'categories': categories?.map((e) => e.toJson()).toList(),
      };
}
